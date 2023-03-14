import "package:flutter_starter/common/exceptions/error_message.dart";

enum OperatorType { create, read, update, delete }

class RepositoryErrorMessage extends ErrorMessage {
  RepositoryErrorMessage({this.operatorType, this.inputData});

  RepositoryErrorMessage.create({this.inputData})
      : operatorType = OperatorType.create;

  RepositoryErrorMessage.read({this.inputData})
      : operatorType = OperatorType.read;

  RepositoryErrorMessage.update({this.inputData})
      : operatorType = OperatorType.update;

  RepositoryErrorMessage.delete({this.inputData})
      : operatorType = OperatorType.delete;

  final OperatorType? operatorType;
  final dynamic inputData;
}
