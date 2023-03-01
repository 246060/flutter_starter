import 'package:flutter/material.dart';
import 'package:flutter_starter/common/styles/styles.dart';

class AppTextStyles {
  final TextTheme light;
  final TextTheme dark;

  AppTextStyles._()
      : light = _light(),
        dark = _dark();

  static final _instance = AppTextStyles._();

  factory AppTextStyles() {
    return _instance;
  }

  static TextTheme _light() {
    final base = ThemeData.light();
    final colors = AppLightColors();

    return base.textTheme.copyWith(
      titleSmall: base.textTheme.titleSmall,
      titleMedium: null,
      titleLarge: null,
      labelSmall: null,
      labelMedium: null,
      labelLarge: null,
      headlineSmall: null,
      headlineMedium: null,
      headlineLarge: null,
      displaySmall: null,
      displayMedium: null,
      displayLarge: null,
      bodySmall: null,
      bodyMedium: null,
      bodyLarge: null,
    );
  }

  static TextTheme _dark() {
    final base = ThemeData.dark();
    final colors = AppDarkColors();

    return base.textTheme.copyWith(
      titleSmall: base.textTheme.titleSmall,
      titleMedium: null,
      titleLarge: null,
      labelSmall: null,
      labelMedium: null,
      labelLarge: null,
      headlineSmall: null,
      headlineMedium: null,
      headlineLarge: null,
      displaySmall: null,
      displayMedium: null,
      displayLarge: null,
      bodySmall: null,
      bodyMedium: null,
      bodyLarge: null,
    );
  }
}
