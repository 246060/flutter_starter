import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppDarkColors extends AppColors {
  factory AppDarkColors() => _instance;

  AppDarkColors._();

  static final _instance = AppDarkColors._();

  @override
  Color get primary => Colors.black38;
}
