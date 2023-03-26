import 'package:flutter_starter/common/repositories/sample/user.dart';

abstract class UserRepository {
  Future<User> findById(int id);
  Future<void> save(User user);
  Future<void> update(User user);
  Future<void> delete(int id);
}
