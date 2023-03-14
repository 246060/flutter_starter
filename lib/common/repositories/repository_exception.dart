import "package:flutter_starter/common/exceptions/error_message.dart";
import "package:flutter_starter/common/exceptions/exceptions.dart";
import "package:flutter_starter/common/repositories/dio_exception_handler.dart";
import "package:flutter_starter/common/repositories/hive_exception_handler.dart";
import "package:flutter_starter/common/repositories/repository_error_message.dart";
import "package:flutter_starter/common/repositories/sqlite_exception_handler.dart";

abstract class RepositoryException extends BaseExceptionEx {
  RepositoryException({
    required super.handler,
    required super.origin,
    this.errorMessage,
  });

  final ErrorMessage? errorMessage;
}

class DioRepositoryException extends RepositoryException {
  DioRepositoryException({
    required super.origin,
    RepositoryErrorMessage? errorMessage,
  }) : super(
          handler: DioExceptionHandler(),
          errorMessage: errorMessage ?? RepositoryErrorMessage(),
        );
}

class HiveRepositoryException extends RepositoryException {
  HiveRepositoryException({
    required super.origin,
    RepositoryErrorMessage? errorMessage,
  }) : super(
          handler: HiveExceptionHandler(),
          errorMessage: errorMessage ?? RepositoryErrorMessage(),
        );
}

class SqliteRepositoryException extends RepositoryException {
  SqliteRepositoryException({
    required super.origin,
    RepositoryErrorMessage? errorMessage,
  }) : super(
          handler: SqliteExceptionHandler(),
          errorMessage: errorMessage ?? RepositoryErrorMessage(),
        );
}
