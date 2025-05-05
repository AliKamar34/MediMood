import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/core/setting/cubit/setting_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit()
      : super(SettingsState(
          locale: const Locale('en'),
          themeMode: ThemeMode.light,
        ));
  static const _prefKeyTheme = 'themeMode';
  static const _prefKeyLocale = 'locale';

  Future<void> loadSettings() async {
    final prefs = await SharedPreferences.getInstance();

    final themeString = prefs.getString(_prefKeyTheme);
    ThemeMode mode;
    switch (themeString) {
      case 'dark':
        mode = ThemeMode.dark;
        break;
      case 'system':
        mode = ThemeMode.system;
        break;
      case 'light':
      default:
        mode = ThemeMode.light;
    }

    final localeCode = prefs.getString(_prefKeyLocale) ?? 'en';
    final locale = Locale(localeCode);

    emit(state.copyWith(themeMode: mode, locale: locale));
  }

  void changeLocale(Locale locale) async {
    emit(state.copyWith(locale: locale));
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_prefKeyLocale, locale.languageCode);
    log('Locale changed to: ${locale.languageCode}');
  }

  void changeThemeMode(ThemeMode mode) async {
    emit(state.copyWith(themeMode: mode));
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(_prefKeyTheme, mode.name);
    log('Theme mode changed to: ${mode.name}');
  }
}
