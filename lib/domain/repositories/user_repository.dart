import 'package:flutter_starter/domain/entities/user/user.dart';

abstract class UserRepository {
  Future<User> find();

  Future<List<User>> findAll();
}
