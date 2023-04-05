import 'package:flutter/material.dart';
import 'package:flutter_starter/core/configs/logger_config.dart';
import 'package:flutter_starter/presentation/styles/app_themes.dart';
import 'package:flutter_starter/presentation/views/screens/home_screen.dart';

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
