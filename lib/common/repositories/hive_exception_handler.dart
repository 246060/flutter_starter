import '../exceptions/error_message.dart';
import '../exceptions/exception_handler.dart';

class HiveExceptionHandler extends ExceptionHandler {
  @override
  ErrorMessage handle(
      {required Exception exception, required ErrorMessage message}) {
    // TODO: implement handle
    throw UnimplementedError();
  }
}
