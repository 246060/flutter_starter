import 'package:dio/dio.dart';
import 'package:flutter_starter/common/models/pagination.dart';
import 'package:flutter_starter/common/models/repository.dart';
import 'package:flutter_starter/common/repositories/sample2/user.dart';
import 'package:sqflite/sqflite.dart';

class UserRepository extends Repository<User> {
  UserRepository({
    dynamic remoteClient,
    dynamic localClient,
  })  : _dio = remoteClient as Dio,
        _sqlite = localClient as Database;

  final Dio _dio;
  final Database _sqlite;

  @override
  Future<void> delete(int id) async {
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<User>> findAllBy({
    List<Query>? where,
    Pagination? pagination,
    List<Sort>? sorts,
  }) async {
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      return [];
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<User> findById(int id) async {
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      return User(id: 1, avatar: '', lastName: '', firstName: '', email: '');
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<User> findOneBy({required List<Query> where}) async {
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      return User(id: 1, avatar: '', lastName: '', firstName: '', email: '');
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<int> save(User t) async {
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      return 1;
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> update(User t) async {
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
    } on Exception catch (_) {
      rethrow;
    }
  }
}
