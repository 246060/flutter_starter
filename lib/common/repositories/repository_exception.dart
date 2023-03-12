import "package:flutter_starter/common/exceptions/exceptions.dart";
import "package:flutter_starter/common/repositories/repository_error_message.dart";

class RepositoryException extends AppException {
  RepositoryException({
    required super.origin,
    super.handler,
    this.operatorType,
    this.inputData,
  });

  final RepositoryOperatorType? operatorType;
  final dynamic inputData;

  @override
  RepositoryErrorMessage get message => handler.handle(
        exception: origin,
        message: RepositoryErrorMessage(
          operatorType: operatorType,
          inputData: inputData,
        ),
      ) as RepositoryErrorMessage;
}
