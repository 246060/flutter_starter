import "package:dio/dio.dart";
import "package:flutter_starter/common/exceptions/error_message.dart";
import "package:flutter_starter/common/exceptions/exception_handler.dart";
import "package:flutter_starter/common/repositories/repository_error_message.dart";

class DioExceptionHandler with ExceptionHandler {
  final String _title = "Network Error";

  @override
  ErrorMessage handle({
    required Exception exception,
    required ErrorMessage message,
  }) {
    exception as DioError;
    message as RepositoryErrorMessage;

    if (exception.type == DioErrorType.connectionTimeout ||
        exception.type == DioErrorType.sendTimeout ||
        exception.type == DioErrorType.receiveTimeout) {
      return handleTimeoutException(
        exception: exception,
        message: message,
      );
    } else if (exception.type == DioErrorType.badCertificate) {
      return handleBadCertificateException(
        exception: exception,
        message: message,
      );
    } else if (exception.type == DioErrorType.badResponse) {
      return handleBadResponseException(
        exception: exception,
        message: message,
      );
    } else if (exception.type == DioErrorType.cancel) {
      return handleCancel(
        exception: exception,
        message: message,
      );
    } else if (exception.type == DioErrorType.connectionError) {
      return handleConnectionErrorException(
        exception: exception,
        message: message,
      );
    } else {
      return message.copyWith(
        title: _title,
        message: "Oops! unknown network error occurred",
      );
    }
  }

  ErrorMessage handleTimeoutException({
    required DioError exception,
    required RepositoryErrorMessage message,
  }) =>
      message.copyWith(
        title: _title,
        message: "Oops! network timeout",
      );

  ErrorMessage handleBadCertificateException({
    required DioError exception,
    required RepositoryErrorMessage message,
  }) =>
      message.copyWith(
        title: _title,
        message: "Oops! network insufficient access",
      );

  ErrorMessage handleBadResponseException({
    required DioError exception,
    required RepositoryErrorMessage message,
  }) =>
      message.copyWith(
        title: _title,
        message: "Oops! bad response",
      );

  ErrorMessage handleConnectionErrorException({
    required DioError exception,
    required RepositoryErrorMessage message,
  }) =>
      message.copyWith(
        title: _title,
        message: "Oops! network error",
      );

  ErrorMessage handleCancel({
    required DioError exception,
    required RepositoryErrorMessage message,
  }) =>
      message.copyWith(
        title: _title,
        message: "Oops! network request cancel",
      );
}
