import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppLightColors extends AppColors {
  @override
  ColorScheme get colorScheme {
    const colorScheme = ColorScheme.light();
    return ColorScheme(
        brightness: Brightness.light,
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
