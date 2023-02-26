import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppLightColors extends AppColors {
  AppLightColors._();

  static final _instance = AppLightColors._();

  factory AppLightColors() {
    return _instance;
  }

  @override
  ColorScheme get colorScheme {
    return const ColorScheme.light(
        brightness: Brightness.light,
        primary: Colors.indigo,
        secondary: Colors.red,
        onSecondary: Colors.white);
  }
}
