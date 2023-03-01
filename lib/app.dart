import 'package:flutter/material.dart';
import 'package:flutter_starter/common/configs/config.dart';
import 'package:flutter_starter/common/styles/app_themes.dart';

import 'home_screen.dart';

final log = getLogger();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    log.i("MyApp Build Started...");

    return MaterialApp(
      title: 'flutter quick start project',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AppThemes().light,
      darkTheme: AppThemes().dark,
      home: const MyHomePage(title: 'Home Screen'),
    );
  }
}
