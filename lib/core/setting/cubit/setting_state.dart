import 'package:flutter/material.dart';

class SettingsState {
  final Locale locale;
  final ThemeMode themeMode;

  SettingsState({
    required this.locale,
    required this.themeMode,
  });

  SettingsState copyWith({
    Locale? locale,
    ThemeMode? themeMode,
  }) {
    return SettingsState(
      locale: locale ?? this.locale,
      themeMode: themeMode ?? this.themeMode,
    );
  }
}
