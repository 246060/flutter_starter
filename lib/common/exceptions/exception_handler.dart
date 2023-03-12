import "package:flutter_starter/common/configs/config.dart";
import "package:flutter_starter/common/exceptions/error_message.dart";

mixin ExceptionHandler {
  ErrorMessage handle({
    required Exception exception,
    required ErrorMessage message,
  });
}

class DefaultExceptionHandler with ExceptionHandler {
  @override
  ErrorMessage handle({
    required Exception exception,
    required ErrorMessage message,
  }) {
    log.e(exception.toString());
    return message.copyWith(extra: exception.toString());
  }
}
