import 'package:flutter/material.dart';
import 'package:flutter_starter/common/styles/app_themes.dart';

import 'home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AppThemes.light,
      darkTheme: AppThemes.dark,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
