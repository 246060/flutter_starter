import 'package:flutter/material.dart';

import 'config/logger_generator.dart';
import 'config/style/app_themes.dart';
import 'screen/home_screen.dart';

class App extends StatelessWidget {
  App({super.key});

  final _log = LoggerGenerator('App').getLogger();

  @override
  Widget build(BuildContext context) {
    _log.i('MyApp Build Started...');

    return MaterialApp(
      title: 'flutter quick start project',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AppThemes().light,
      darkTheme: AppThemes().dark,
      home: const HomeScreen(title: 'Home Screen'),
    );
  }
}
