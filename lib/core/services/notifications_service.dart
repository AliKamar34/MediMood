import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tzl;
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:permission_handler/permission_handler.dart';

class NotificationService {
  static const String _channelId = 'medi_mood_channel';
  static const String _channelName = 'MediMood Notifications';
  static const String _channelDescription = 'Medication Reminders';

  final FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();
  bool isInitialized = false;

  Future<void> initNotifications() async {
    if (isInitialized) return;

    // Initialize timezones
    tzl.initializeTimeZones();
    final String locationName = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(locationName));

    // Create notification channel
    await _createNotificationChannel();

    // Initialize plugin
    const AndroidInitializationSettings android =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const DarwinInitializationSettings iOS = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    await notificationsPlugin.initialize(
      const InitializationSettings(android: android, iOS: iOS),
    );
    if (await Permission.ignoreBatteryOptimizations.isDenied) {
      await Permission.ignoreBatteryOptimizations.request();
    }
    if (await Permission.notification.isDenied) {
      await Permission.notification.request();
    }

    isInitialized = true;
  }

  Future<void> _createNotificationChannel() async {
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      _channelId,
      _channelName,
      description: _channelDescription,
      importance: Importance.max,
      playSound: true,
    );

    await notificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  Future<void> requestPermissions() async {
    // For Android 13+
    if (Platform.isAndroid) {
      await Permission.notification.request();
      await requestExactAlarmPermission();
    }
  }

  Future<void> requestExactAlarmPermission() async {
    final androidPlugin =
        notificationsPlugin.resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>();
    await androidPlugin?.requestExactAlarmsPermission();
  }

  NotificationDetails _notificationDetails() {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        _channelId,
        _channelName,
        channelDescription: _channelDescription,
        importance: Importance.max,
        priority: Priority.high,
        playSound: true,
      ),
      iOS: DarwinNotificationDetails(),
    );
  }

  Future<void> showNotification({
    required String title,
    required String body,
    int? id,
  }) async {
    return notificationsPlugin.show(
      id ?? 0,
      title,
      body,
      _notificationDetails(),
    );
  }

  final String scheduledTimesKey = 'scheduledTimes';
  int _notificationId = 0;
  Future<void> scheduleNotification({
    required String title,
    required String body,
    required int hour,
    required int minute,
    int? id,
  }) async {
    final now = tz.TZDateTime.now(tz.local);
    var scheduledDate =
        tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, minute);

    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }

    final String pillKey = '${title}_${hour}_$minute';
    final prefs = await SharedPreferences.getInstance();
    final List<String> scheduledTimes =
        prefs.getStringList(scheduledTimesKey) ?? [];

    if (scheduledTimes.contains(pillKey)) {
      log('Notification already scheduled: $pillKey with id $id');
      return;
    }
    id ??= _notificationId++;
    try {
      await notificationsPlugin.zonedSchedule(
        id,
        title,
        body,
        scheduledDate,
        _notificationDetails(),
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
        matchDateTimeComponents: DateTimeComponents.time,
        payload: pillKey,
      );

      scheduledTimes.add(pillKey);
      await prefs.setStringList(scheduledTimesKey, scheduledTimes);
      log('Successfully scheduled: $pillKey');
    } catch (e, stackTrace) {
      log('Error scheduling notification: $e');
      log('Stack trace: $stackTrace');
      debugPrint('Error scheduling notification: $e');
      debugPrint('Stack trace: $stackTrace');
    }
  }

  Future<void> cancelAllNotifications() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(scheduledTimesKey);
    await notificationsPlugin.cancelAll();
    log('All notifications cancelled');
  }

  Future<void> cancelNotification(int id) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> scheduledTimes =
        prefs.getStringList(scheduledTimesKey) ?? [];

    for (String pillKey in scheduledTimes) {
      if (pillKey.contains(id.toString())) {
        scheduledTimes.remove(pillKey);
        break;
      }
    }

    await prefs.setStringList(scheduledTimesKey, scheduledTimes);
    await notificationsPlugin.cancel(id);
    log('Notification with id $id cancelled');
  }
}
