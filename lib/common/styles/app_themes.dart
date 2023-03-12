import "package:flutter/material.dart";
import "package:flutter_starter/common/styles/styles.dart";

class AppThemes {
  factory AppThemes() => _instance;

  AppThemes._()
      : light = _light(),
        dark = _dark();

  late final ThemeData light;
  late final ThemeData dark;

  static final _instance = AppThemes._();

  static ThemeData _light() {
    final baseTheme = ThemeData.light();
    final baseColorScheme = baseTheme.colorScheme;
    final colors = AppLightColors();

    return baseTheme.copyWith(
      textTheme: AppTextStyles().light,
      colorScheme: baseColorScheme.copyWith(
        primary: colors.primary,
        onPrimary: null,
        primaryContainer: null,
        onPrimaryContainer: null,
        secondary: null,
        secondaryContainer: null,
        onSecondary: null,
        onSecondaryContainer: null,
        background: null,
        onBackground: null,
        error: null,
        errorContainer: null,
        onError: null,
        onErrorContainer: null,
        tertiary: null,
        tertiaryContainer: null,
        onTertiary: null,
        onTertiaryContainer: null,
        surface: null,
        surfaceTint: null,
        surfaceVariant: null,
        onSurface: null,
        onSurfaceVariant: null,
        outline: null,
        outlineVariant: null,
        scrim: null,
        shadow: null,
        inversePrimary: null,
        inverseSurface: null,
        onInverseSurface: null,
      ),
    );
  }

  static ThemeData _dark() {
    final baseTheme = ThemeData.dark();
    final baseColorScheme = baseTheme.colorScheme;
    final colors = AppDarkColors();

    return baseTheme.copyWith(
      textTheme: AppTextStyles().dark,
      colorScheme: baseColorScheme.copyWith(
        primary: colors.primary,
        onPrimary: null,
        primaryContainer: null,
        onPrimaryContainer: null,
        secondary: null,
        secondaryContainer: null,
        onSecondary: null,
        onSecondaryContainer: null,
        background: null,
        onBackground: null,
        error: null,
        errorContainer: null,
        onError: null,
        onErrorContainer: null,
        tertiary: null,
        tertiaryContainer: null,
        onTertiary: null,
        onTertiaryContainer: null,
        surface: null,
        surfaceTint: null,
        surfaceVariant: null,
        onSurface: null,
        onSurfaceVariant: null,
        outline: null,
        outlineVariant: null,
        scrim: null,
        shadow: null,
        inversePrimary: null,
        inverseSurface: null,
        onInverseSurface: null,
      ),
    );
  }
}
