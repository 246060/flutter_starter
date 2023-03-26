import 'package:dio/dio.dart';
import 'package:flutter_starter/common/exceptions/error_message.dart';
import 'package:flutter_starter/common/exceptions/exception_handler.dart';
import 'package:flutter_starter/common/repositories/repository_exception.dart';

class DioExceptionHandler with ExceptionHandler {
  @override
  ErrorMessage handle(Exception exception) {
    final origin = (exception as DioRepositoryException).origin! as DioError;

    if (origin.type == DioErrorType.connectionTimeout ||
        origin.type == DioErrorType.sendTimeout ||
        origin.type == DioErrorType.receiveTimeout) {
      return handleTimeoutException(exception);
    } else if (origin.type == DioErrorType.badCertificate) {
      return handleBadCertificateException(exception);
    } else if (origin.type == DioErrorType.badResponse) {
      return handleBadResponseException(exception);
    } else if (origin.type == DioErrorType.cancel) {
      return handleCancel(exception);
    } else if (origin.type == DioErrorType.connectionError) {
      return handleConnectionErrorException(exception);
    } else {
      return handleException(exception);
    }
  }

  ErrorMessage handleTimeoutException(DioRepositoryException exception) =>
      exception.errorMessage ?? ErrorMessage();

  ErrorMessage handleBadCertificateException(
    DioRepositoryException exception,
  ) =>
      exception.errorMessage ?? ErrorMessage();

  ErrorMessage handleBadResponseException(DioRepositoryException exception) =>
      exception.errorMessage ?? ErrorMessage();

  ErrorMessage handleCancel(DioRepositoryException exception) =>
      exception.errorMessage ?? ErrorMessage();

  ErrorMessage handleConnectionErrorException(
    DioRepositoryException exception,
  ) =>
      exception.errorMessage ?? ErrorMessage();

  ErrorMessage handleException(DioRepositoryException exception) =>
      exception.errorMessage ?? ErrorMessage();
}
