import "package:flutter_starter/common/exceptions/error_message.dart";
import "package:flutter_starter/common/exceptions/exception_handler.dart";

class HiveExceptionHandler with ExceptionHandler {
  @override
  ErrorMessage handle({
    required Exception exception,
    required ErrorMessage message,
  }) {
    // TODO(blackcocoon): implement handle
    throw UnimplementedError();
  }
}
