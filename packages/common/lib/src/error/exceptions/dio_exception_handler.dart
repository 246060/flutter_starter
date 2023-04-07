import 'package:dio/dio.dart';

import 'error_message.dart';
import 'exception_handler.dart';

class DioExceptionHandler with ExceptionHandler {
  @override
  ErrorMessage handle(Exception exception) {
    final origin = exception as DioError;

    if (origin.type == DioErrorType.connectionTimeout ||
        origin.type == DioErrorType.sendTimeout ||
        origin.type == DioErrorType.receiveTimeout) {
      return handleTimeout(exception);
    } else if (origin.type == DioErrorType.badCertificate) {
      return handleBadCertificate(exception);
    } else if (origin.type == DioErrorType.badResponse) {
      return handleBadResponse(exception);
    } else if (origin.type == DioErrorType.cancel) {
      return handleCancel(exception);
    } else if (origin.type == DioErrorType.connectionError) {
      return handleConnectionError(exception);
    } else {
      return _handle(exception);
    }
  }

  ErrorMessage handleTimeout(DioError exception) => ErrorMessage();
  ErrorMessage handleBadCertificate(DioError exception) => ErrorMessage();
  ErrorMessage handleBadResponse(DioError exception) => ErrorMessage();
  ErrorMessage handleCancel(DioError exception) => ErrorMessage();
  ErrorMessage handleConnectionError(DioError exception) => ErrorMessage();
  ErrorMessage _handle(DioError exception) => ErrorMessage();
}
