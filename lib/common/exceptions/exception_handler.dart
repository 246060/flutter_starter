import '../configs/config.dart';
import 'error_message.dart';

abstract class ExceptionHandler {
  ErrorMessage handle(
      {required Exception exception, required ErrorMessage message});
}

class DefaultExceptionHandler extends ExceptionHandler {
  @override
  ErrorMessage handle(
      {required Exception exception, required ErrorMessage message}) {
    log.e(exception.toString());
    return message.copyWith(extra: exception.toString());
  }
}
