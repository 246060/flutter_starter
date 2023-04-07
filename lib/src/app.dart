import 'package:app_common/common.dart';
import 'package:flutter/material.dart';

import 'configs/styles/app_themes.dart';
import 'screens/home_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    log.i('MyApp Build Started...');

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