import "dart:async";

import "package:flutter_starter/common/exceptions/exception_handler.dart";
import "package:flutter_starter/common/exceptions/exceptions.dart";
import "package:flutter_starter/common/repositories/repository_error_message.dart";
import "package:flutter_starter/common/repositories/repository_exception.dart";
import "package:flutter_starter/common/repositories/sample/user.dart";
import "package:flutter_starter/common/repositories/sample/user_repository.dart";
import "package:hive_flutter/adapters.dart";

class HiveUserRepository extends UserRepository {
  HiveUserRepository({required this.box, required this.exceptionHandler});

  final Box<Map<String, dynamic>> box;
  final ExceptionHandler exceptionHandler;

  @override
  Future<User> findById(int id) async {
    try {
      final result = box.get(id) ?? {};
      return User.fromJson(
        result.isNotEmpty
            ? result
            : throw ResourceNotFoundException(message: "user(id:$id)"),
      );
    } on ResourceNotFoundException catch (e) {
      throw HiveRepositoryException(
        origin: e,
        errorMessage: RepositoryErrorMessage.read(inputData: "user(id:$id)"),
      );
    } on Exception catch (e) {
      throw HiveRepositoryException(
        origin: e,
        errorMessage: RepositoryErrorMessage.read(inputData: "user(id:$id)"),
      );
    }
  }

  @override
  Future<void> delete(int id) {
    // TODO(blackcocoon): implement delete
    throw UnimplementedError();
  }

  @override
  Future<void> save(User user) {
    // TODO(blackcocoon): implement save
    throw UnimplementedError();
  }

  @override
  Future<void> update(User user) {
    // TODO(blackcocoon): implement update
    throw UnimplementedError();
  }
}
