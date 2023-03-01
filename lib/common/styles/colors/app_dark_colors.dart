import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppDarkColors extends AppColors {
  AppDarkColors._();

  static final _instance = AppDarkColors._();

  factory AppDarkColors() {
    return _instance;
  }

  @override
  Color get primary => Colors.black38;
}
