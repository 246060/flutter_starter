import 'package:flutter_starter/common/repositories/sample/user.dart';

import '../../exceptions/exception_handler.dart';
import 'user_repository.dart';

class HiveUserRepository extends UserRepository {
  final ExceptionHandler exceptionHandler;

  HiveUserRepository({required this.exceptionHandler});

  @override
  Future<void> delete(int id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<User> findById(int id) {
    // TODO: implement findById
    throw UnimplementedError();
  }

  @override
  Future<void> save(User user) {
    // TODO: implement save
    throw UnimplementedError();
  }

  @override
  Future<void> update(User user) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
