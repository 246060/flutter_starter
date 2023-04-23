import 'package:app_domain/domain.dart';
import 'package:dio/dio.dart';

import '../config/logger_generator.dart';

class UserRepository implements IUserRepository {
  UserRepository({
    required Dio dio,
  }) : _dio = dio;

  final _log = LoggerGenerator('UserRepository').getLogger();
  final Dio _dio;
  final String _baseUrl = 'https://reqres.in/api';

  @override
  Future<GetUserRpOut> getById(GetUserRpIn inDto) async {
    try {
      _log.i(inDto);
      final res0 =
          await _dio.get<Map<String, dynamic>>('$_baseUrl/users/${inDto.id}');

      final outDto = GetUserRpOut(
        user: User.fromJson(res0.data!['data'] as Map<String, dynamic>),
        support: res0.data!['support'] as Map<String, dynamic>,
      );

      _log.i(outDto);
      return outDto;
    } on Exception catch (e) {
      _log.e(e.toString());
      rethrow;
    }
  }

  @override
  Future<CreateUserRpOut> create(CreateUserRpIn inDto) async {
    try {
      _log.i(inDto);
      final res0 = await _dio.post<Map<String, dynamic>>(
        '$_baseUrl/users',
        data: inDto.toJson(),
      );

      _log.d(res0.data);
      return CreateUserRpOut(userId: res0.data!['id'] as int);
    } on Exception catch (e) {
      _log.e(e.toString());
      rethrow;
    }
  }

  @override
  Future<DeleteUserRpOut> delete(DeleteUserRpIn inDto) async {
    try {
      _log.i(inDto);
      final res0 = await _dio.delete<Map<String, dynamic>>(
        '$_baseUrl/users/${inDto.userId}',
      );

      _log.d(res0.data);
      return DeleteUserRpOut(userId: inDto.userId);
    } on Exception catch (e) {
      _log.e(e.toString());
      rethrow;
    }
  }

  @override
  Future<UpdateUserRpOut> update(UpdateUserRpIn inDto) async {
    try {
      _log.i(inDto);
      final res0 = await _dio.patch<Map<String, dynamic>>(
        '$_baseUrl/users',
        data: inDto.toJson(),
      );

      _log.d(res0.data);
      return UpdateUserRpOut(userId: res0.data!['id'] as int);
    } on Exception catch (e) {
      _log.e(e.toString());
      rethrow;
    }
  }
}
