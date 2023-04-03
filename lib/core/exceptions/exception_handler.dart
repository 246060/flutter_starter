import 'package:flutter_starter/core/configs/logger_config.dart';
import 'package:flutter_starter/core/exceptions/error_message.dart';

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
