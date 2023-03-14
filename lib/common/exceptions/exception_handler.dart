import "package:flutter_starter/common/configs/config.dart";
import "package:flutter_starter/common/exceptions/error_message.dart";

mixin ExceptionHandler {
  ErrorMessage handle(Exception exception);
}

class DefaultExceptionHandler with ExceptionHandler {
  @override
  ErrorMessage handle(Exception exception) {
    log.e(exception.toString());
    return ErrorMessage();
  }
}
