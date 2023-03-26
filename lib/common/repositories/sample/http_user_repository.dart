import 'package:dio/dio.dart';
import 'package:flutter_starter/common/repositories/sample/user.dart';
import 'package:flutter_starter/common/repositories/sample/user_repository.dart';

class HttpUserRepository extends UserRepository {
  HttpUserRepository({required this.dio});

  final Dio dio;

  @override
  Future<User> findById(int id) async {
    try {
      final res = await dio
          .get<Map<String, dynamic>>('https://reqres.in/api/users/$id');
      return User.fromJson(res.data?['data'] as Map<String, dynamic>);
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> delete(int id) {
    throw UnimplementedError();
  }

  @override
  Future<void> save(User user) {
    throw UnimplementedError();
  }

  @override
  Future<void> update(User user) {
    throw UnimplementedError();
  }
}
