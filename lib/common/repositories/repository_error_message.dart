import "package:flutter_starter/common/exceptions/error_message.dart";

enum RepositoryOperatorType { C, R, U, D }

class RepositoryErrorMessage extends ErrorMessage {
  RepositoryErrorMessage({
    this.operatorType,
    this.inputData,
    super.code,
    super.title,
    super.message,
    super.extra,
  });

  final RepositoryOperatorType? operatorType;
  final dynamic inputData;

  @override
  RepositoryErrorMessage copyWith({
    ErrorCode? code,
    String? title,
    String? message,
    dynamic extra,
  }) =>
      RepositoryErrorMessage(
        code: code ?? this.code,
        title: title ?? this.title,
        message: message ?? this.message,
        extra: extra ?? this.extra,
        operatorType: operatorType,
        inputData: inputData,
      );
}
