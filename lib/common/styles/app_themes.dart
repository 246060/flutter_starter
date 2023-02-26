import 'package:flutter/material.dart';

import 'styles.dart';

class AppThemes {
  static final lightColors = AppLightColors();
  static final darkColors = AppDarkColors();

  static ThemeData get light => ThemeData(colorScheme: lightColors.colorScheme);

  static ThemeData get dark => ThemeData(colorScheme: darkColors.colorScheme);
}
