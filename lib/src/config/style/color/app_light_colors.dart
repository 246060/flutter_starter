import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppLightColors extends AppColors {
  factory AppLightColors() => _instance;

  AppLightColors._();

  static final _instance = AppLightColors._();

  @override
  Color get primary => Colors.indigo;
}
