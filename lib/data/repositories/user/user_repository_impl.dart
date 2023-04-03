import 'package:flutter_starter/data/repositories/user/local_data_source.dart';
import 'package:flutter_starter/data/repositories/user/remote_data_source.dart';
import 'package:flutter_starter/domain/entities/user/user.dart';
import 'package:flutter_starter/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl({
    required LocalDataSource localDataSource,
    required RemoteDataSource remoteDataSource,
  })  : _localDataSource = localDataSource,
        _remoteDataSource = remoteDataSource;

  final LocalDataSource _localDataSource;
  final RemoteDataSource _remoteDataSource;

  @override
  Future<User> find() {
    throw UnimplementedError();
  }

  @override
  Future<int> save() {
    throw UnimplementedError();
  }
}
