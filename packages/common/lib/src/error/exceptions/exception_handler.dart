import '../../logger_generator.dart';
import 'error_message.dart';

mixin ExceptionHandler {
  ErrorMessage handle(Exception exception);
}

class DefaultExceptionHandler with ExceptionHandler {
  final _log = LoggerGenerator('DefaultExceptionHandler').getLogger();

  @override
  ErrorMessage handle(Exception exception) {
    _log.e(exception.toString());
    return ErrorMessage();
  }
}
