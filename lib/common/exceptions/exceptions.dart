import "package:flutter_starter/common/exceptions/error_message.dart";
import "package:flutter_starter/common/exceptions/exception_handler.dart";

abstract class AppException implements Exception {
  AppException({required this.origin, ExceptionHandler? handler})
      : handler = handler ?? DefaultExceptionHandler();

  final Exception origin;
  final ExceptionHandler handler;

  ErrorMessage get message =>
      handler.handle(exception: origin, message: ErrorMessage());
}
