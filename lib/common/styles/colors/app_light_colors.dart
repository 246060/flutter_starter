import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppLightColors extends AppColors {
  AppLightColors._();

  static final _instance = AppLightColors._();

  factory AppLightColors() {
    return _instance;
  }

  @override
  Color get primary => Colors.indigo;
}
