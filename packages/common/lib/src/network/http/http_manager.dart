import 'package:dio/dio.dart';

class HttpManager {
  factory HttpManager() => _instance;

  HttpManager._();

  static final _instance = HttpManager._();

  final Dio _base = Dio(
    BaseOptions(
      baseUrl: 'https://reqres.in',
      followRedirects: true,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      sendTimeout: const Duration(seconds: 60),
      maxRedirects: 3,
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
    ),
  );

  Dio get base => _base;
}
