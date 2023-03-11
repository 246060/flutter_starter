import 'package:flutter_starter/common/exceptions/exceptions.dart';

import 'repository_error_message.dart';

class RepositoryException extends AppException {
  final RepositoryOperatorType? operatorType;
  final dynamic inputData;

  RepositoryException(
      {required super.origin,
      super.handler,
      this.operatorType,
      this.inputData});

  @override
  RepositoryErrorMessage get message => handler.handle(
      exception: origin,
      message: RepositoryErrorMessage(
          operatorType: operatorType,
          inputData: inputData)) as RepositoryErrorMessage;

  RepositoryException copyWith(
          {Exception? origin,
          RepositoryOperatorType? operatorType,
          dynamic inputData}) =>
      RepositoryException(
          origin: origin ?? this.origin,
          handler: handler,
          operatorType: operatorType ?? this.operatorType,
          inputData: inputData ?? this.inputData);
}
