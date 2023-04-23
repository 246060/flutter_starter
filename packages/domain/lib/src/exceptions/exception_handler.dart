import 'package:app_data/data.dart';

import 'failure.dart';

class ExceptionHandler {
  factory ExceptionHandler() => _instance;

  ExceptionHandler._();

  static final _instance = ExceptionHandler._();

  Failure handle(Exception ex) {
    if (ex is NotFoundException) {
      return Failure.notFound();
    } else if (ex is TokenExpiredException) {
      return Failure.tokenExpired();
    } else {
      return Failure.unknown();
    }
  }
}
