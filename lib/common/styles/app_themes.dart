import 'package:flutter/material.dart';

import 'styles.dart';

class AppThemes {
  static final lightColors = AppLightColors();
  static final darkColors = AppDarkColors();

  static ThemeData get light =>
      ThemeData(primaryColor: Colors.indigo, textTheme: AppTextStyles.light
          //    colorScheme: lightColors.colorScheme
          );

  static ThemeData get dark =>
      ThemeData(primaryColor: Colors.deepOrange, textTheme: AppTextStyles.dark
          //    colorScheme: darkColors.colorScheme
          );
}
