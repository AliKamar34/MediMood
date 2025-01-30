import 'dart:developer';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:flutter_timezone/flutter_timezone.dart';

class NotificationService {
  final notificationsPlugin = FlutterLocalNotificationsPlugin();
  bool isInitialized = false;
  bool get initialized => isInitialized;

  Future<void> initNotifications() async {
    if (isInitialized) return;
    tz.initializeTimeZones();
    final String locationName = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(locationName));

    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iOS = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );
    const initSettings = InitializationSettings(
      android: android,
      iOS: iOS,
    );
    await notificationsPlugin.initialize(initSettings);
  }

  NotificationDetails notificationDetails() {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'channel id',
        'channel name',
        channelDescription: 'channel description',
        importance: Importance.max,
        priority: Priority.high,
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
      notificationDetails(),
    );
  }

  final String scheduledTimesKey = 'scheduledTimes';

  Future<void> scheduleNotification({
    required String title,
    required String body,
    required int hour,
    required int minute,
    int? id,
  }) async {
    final now = tz.TZDateTime.now(tz.local);
    var scheduledDate = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      hour,
      minute,
    );
    String pillKey = '${title}_$hour:$minute';
    final prefs = await SharedPreferences.getInstance();
    List<String> scheduledTimes = prefs.getStringList(scheduledTimesKey) ?? [];
    if (scheduledTimes.contains(pillKey)) {
      log("Notification for $pillKey is already scheduled!");
      return;
    }

    scheduledTimes.add(pillKey);
    await prefs.setStringList(scheduledTimesKey, scheduledTimes);
    log("Scheduling notification for $pillKey at $hour:$minute");

    log('Notification scheduled at $hour:$minute');
    await notificationsPlugin.zonedSchedule(
      id ?? 0,
      title,
      body,
      scheduledDate,
      notificationDetails(),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  Future<void> cancelNotification() async {
    await notificationsPlugin.cancelAll();
  }
}
