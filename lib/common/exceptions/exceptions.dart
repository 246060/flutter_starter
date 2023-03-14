import "package:flutter_starter/common/exceptions/error_message.dart";
import "package:flutter_starter/common/exceptions/exception_handler.dart";

abstract class BaseException implements Exception {
  BaseException({this.message, this.origin});

  final dynamic message;
  final Exception? origin;

  @override
  String toString() =>
      "Exception: ${origin?.toString() ?? message ?? 'unknown error'}";
}

abstract class BaseExceptionEx extends BaseException {
  BaseExceptionEx({
    required this.handler,
    required super.origin,
    super.message,
  });

  final ExceptionHandler handler;

  ErrorMessage toMessage() => handler.handle(this);
}

class ResourceNotFoundException extends BaseException {
  ResourceNotFoundException({dynamic message, super.origin})
      : super(message: "resource[$message] not found");
}

class DefaultExceptionEx extends BaseExceptionEx {
  DefaultExceptionEx({required super.origin})
      : super(handler: DefaultExceptionHandler());
}
