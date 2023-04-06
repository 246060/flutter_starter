
import '../../configs/logger_config.dart';
import 'error_message.dart';

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
