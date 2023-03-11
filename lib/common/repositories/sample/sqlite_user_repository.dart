import '../../exceptions/exception_handler.dart';
import 'user.dart';
import 'user_repository.dart';

class SqliteUserRepository extends UserRepository {
  final ExceptionHandler exceptionHandler;

  SqliteUserRepository({required this.exceptionHandler});

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
