import "package:flutter_starter/common/exceptions/exception_handler.dart";
import "package:flutter_starter/common/repositories/sample/user.dart";
import "package:flutter_starter/common/repositories/sample/user_repository.dart";

class HiveUserRepository extends UserRepository {
  HiveUserRepository({required this.exceptionHandler});

  final ExceptionHandler exceptionHandler;

  @override
  Future<void> delete(int id) {
    // TODO(blackcocoon): implement delete
    throw UnimplementedError();
  }

  @override
  Future<User> findById(int id) {
    // TODO(blackcocoon): implement findById
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
