import 'package:dio/dio.dart';

import '../exceptions/error_message.dart';
import '../exceptions/exception_handler.dart';


class DioExceptionHandler extends ExceptionHandler {
  final String _title = "Network Error";

  @override
  ErrorMessage handle(
      {required Exception exception, required ErrorMessage message}) {
    DioError error = exception as DioError;

    if (error.type == DioErrorType.connectionTimeout ||
        error.type == DioErrorType.sendTimeout ||
        error.type == DioErrorType.receiveTimeout) {
      return handleTimeoutException(exception: exception, message: message);
    } else if (error.type == DioErrorType.badCertificate) {
      return handleBadCertificateException(
          exception: exception, message: message);
    } else if (error.type == DioErrorType.badResponse) {
      return handleBadResponseException(exception: exception, message: message);
    } else if (error.type == DioErrorType.cancel) {
      return handleCancel(exception: exception, message: message);
    } else if (error.type == DioErrorType.connectionError) {
      return handleConnectionErrorException(
          exception: exception, message: message);
    } else {
      return message.copyWith(
          title: _title, message: "Oops! unknown network error occurred");
    }
  }

  ErrorMessage handleTimeoutException(
      {required Exception exception, required ErrorMessage message}) {
    exception as DioError;
    return message.copyWith(title: _title, message: "Oops! network timeout");
  }

  ErrorMessage handleBadCertificateException(
      {required Exception exception, required ErrorMessage message}) {
    exception as DioError;
    return message.copyWith(
        title: _title, message: "Oops! network insufficient access");
  }

  ErrorMessage handleBadResponseException(
      {required Exception exception, required ErrorMessage message}) {
    exception as DioError;
    return message.copyWith(title: _title, message: "Oops! bad response");
  }

  ErrorMessage handleConnectionErrorException(
      {required Exception exception, required ErrorMessage message}) {
    exception as DioError;
    return message.copyWith(title: _title, message: "Oops! network error");
  }

  ErrorMessage handleCancel(
      {required Exception exception, required ErrorMessage message}) {
    exception as DioError;
    return message.copyWith(
        title: _title, message: "Oops! network request cancel");
  }
}
