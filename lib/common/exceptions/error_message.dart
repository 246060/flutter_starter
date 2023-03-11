enum ErrorCode { unknown }

class ErrorMessage {
  final ErrorCode? code;
  final String title;
  final String message;
  final dynamic extra;

  ErrorMessage(
      {this.code = ErrorCode.unknown,
      this.title = "Error",
      this.message = "Oops! something went wrong.",
      this.extra});

  ErrorMessage copyWith(
          {ErrorCode? code, String? title, String? message, dynamic extra}) =>
      ErrorMessage(
          code: code ?? this.code,
          title: title ?? this.title,
          message: message ?? this.message,
          extra: extra ?? this.extra);
}
