import 'package:flutter/material.dart';

class AppTextStyles {
  static final baseLight = ThemeData.light().textTheme;
  static final baseDark = ThemeData.dark().textTheme;

  static TextTheme get light => TextTheme(
        titleSmall: baseLight.titleSmall?.copyWith(color: Colors.amber),
        titleMedium: baseLight.titleMedium?.copyWith(color: Colors.cyan),
        titleLarge: baseLight.titleLarge?.copyWith(color: Colors.amber),
        labelSmall: baseLight.labelSmall?.copyWith(color: Colors.amber),
        labelMedium: baseLight.labelMedium?.copyWith(color: Colors.amber),
        labelLarge: baseLight.labelLarge?.copyWith(color: Colors.amber),
        headlineSmall: baseLight.headlineSmall?.copyWith(color: Colors.amber),
        headlineMedium: baseLight.headlineMedium?.copyWith(color: Colors.amber),
        headlineLarge: baseLight.headlineLarge?.copyWith(color: Colors.amber),
        displaySmall: baseLight.displaySmall?.copyWith(color: Colors.amber),
        displayMedium: baseLight.displayMedium?.copyWith(color: Colors.amber),
        displayLarge: baseLight.displayLarge?.copyWith(color: Colors.amber),
        bodySmall: baseLight.bodySmall?.copyWith(color: Colors.amber),
        bodyMedium: baseLight.bodyMedium?.copyWith(color: Colors.amber),
        bodyLarge: baseLight.bodyLarge?.copyWith(color: Colors.amber),
      );

  static TextTheme get dark => TextTheme(
        titleSmall: baseLight.titleSmall?.copyWith(color: Colors.amber),
        titleMedium: baseLight.titleMedium?.copyWith(color: Colors.cyan),
        titleLarge: baseLight.titleLarge?.copyWith(color: Colors.amber),
        labelSmall: baseLight.labelSmall?.copyWith(color: Colors.amber),
        labelMedium: baseLight.labelMedium?.copyWith(color: Colors.amber),
        labelLarge: baseLight.labelLarge?.copyWith(color: Colors.amber),
        headlineSmall: baseLight.headlineSmall?.copyWith(color: Colors.amber),
        headlineMedium: baseLight.headlineMedium?.copyWith(color: Colors.amber),
        headlineLarge: baseLight.headlineLarge?.copyWith(color: Colors.amber),
        displaySmall: baseLight.displaySmall?.copyWith(color: Colors.amber),
        displayMedium: baseLight.displayMedium?.copyWith(color: Colors.amber),
        displayLarge: baseLight.displayLarge?.copyWith(color: Colors.amber),
        bodySmall: baseLight.bodySmall?.copyWith(color: Colors.amber),
        bodyMedium: baseLight.bodyMedium?.copyWith(color: Colors.amber),
        bodyLarge: baseLight.bodyLarge?.copyWith(color: Colors.amber),
      );
}
