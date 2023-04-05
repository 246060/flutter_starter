import 'package:dio/dio.dart';
import 'package:flutter_starter/domain/entities/user/user.dart';
import 'package:flutter_starter/domain/repositories/user_repository.dart';
import 'package:hive_flutter/hive_flutter.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl({
    required Box<Map<String, dynamic>> localDataSource,
    required Dio remoteDataSource,
  })  : _localDataSource = localDataSource,
        _remoteDataSource = remoteDataSource;

  final Box<Map<String, dynamic>> _localDataSource;
  final Dio _remoteDataSource;

  @override
  Future<User> find() async {
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      return User(
        id: 10000,
        email: 'tiger@gmail.com',
        firstName: 'hello',
        lastName: 'world',
        avatar: '',
      );
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<User>> findAll() {
    throw UnimplementedError();
  }
}
