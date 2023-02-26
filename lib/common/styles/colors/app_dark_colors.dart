import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppDarkColors extends AppColors {
  AppDarkColors._();

  static final _instance = AppDarkColors._();

  factory AppDarkColors() {
    return _instance;
  }

  @override
  ColorScheme get colorScheme {
    return const ColorScheme.dark(
        brightness: Brightness.dark,
        primary: Colors.green,
        secondary: Colors.yellow,
        onSecondary: Colors.black);
  }
}
