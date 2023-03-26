import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/common/configs/config.dart';
import 'package:flutter_starter/common/repositories/dio_exception_handler.dart';
import 'package:flutter_starter/common/repositories/dio_log_interceptor.dart';
import 'package:flutter_starter/common/repositories/sample/http_user_repository.dart';
import 'package:flutter_starter/common/styles/styles.dart';
import 'package:flutter_starter/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    log.i('MyApp Build Started...');

    unawaited(
      HttpUserRepository(
        exceptionHandler: DioExceptionHandler(),
        dio: Dio(
          BaseOptions(
            connectTimeout: const Duration(seconds: 5),
            receiveTimeout: const Duration(seconds: 5),
          ),
        )..interceptors.add(
            DioLogInterceptor(
              requestBody: true,
              responseBody: true,
              logPrint: log.i,
            ),
          ),
      )
          .findById(3)
          .then(log.i)
          .onError((error, stackTrace) => log.e('', error, stackTrace)),
    );

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
