import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'common/configs/config.dart';
import 'common/repositories/dio_exception_handler.dart';
import 'common/repositories/sample/http_user_repository.dart';
import 'common/styles/styles.dart';
import 'home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    log.i("MyApp Build Started...");

    HttpUserRepository(
            exceptionHandler: DioExceptionHandler(),
            dio: Dio(
              BaseOptions(
                  connectTimeout: const Duration(seconds: 5),
                  receiveTimeout: const Duration(seconds: 5)),
            )..interceptors.add(LogInterceptor(
                requestBody: true,
                responseBody: true,
                logPrint: (Object object) => log.i(object))))
        .findById(2)
        .then((value) => log.i(value))
        .onError((error, stackTrace) => log.e(error));

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
