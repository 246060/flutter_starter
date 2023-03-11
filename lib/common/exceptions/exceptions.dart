import 'error_message.dart';
import 'exception_handler.dart';

abstract class AppException implements Exception {
  final Exception origin;
  final ExceptionHandler handler;

  AppException({required this.origin, ExceptionHandler? handler})
      : handler = handler ?? DefaultExceptionHandler();

  ErrorMessage get message =>
      handler.handle(exception: origin, message: ErrorMessage());
}
