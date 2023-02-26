import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppDarkColors extends AppColors {
  @override
  ColorScheme get colorScheme {
    const colorScheme = ColorScheme.dark();
    return ColorScheme(
        brightness: Brightness.dark,
        primary: colorScheme.primary,
        onPrimary: colorScheme.onPrimary,
        secondary: colorScheme.secondary,
        onSecondary: colorScheme.onSecondary,
        error: colorScheme.error,
        onError: colorScheme.onError,
        background: colorScheme.background,
        onBackground: colorScheme.onBackground,
        surface: colorScheme.surface,
        onSurface: colorScheme.onSurface);
  }
}
