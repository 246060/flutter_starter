import 'package:dio/dio.dart';

import '../../exceptions/exception_handler.dart';
import '../repository_error_message.dart';
import '../repository_exception.dart';
import 'user.dart';
import 'user_repository.dart';

class HttpUserRepository extends UserRepository {
  final Dio _dio;
  final ExceptionHandler exceptionHandler;

  HttpUserRepository({required Dio dio, required this.exceptionHandler})
      : _dio = dio;

  @override
  Future<User> findById(int id) async {
    try {
      final res = await _dio.get("https://reqres.in/api/users/$id");
      return User.fromJson(res.data["data"]);
    } on DioError catch (e) {
      throw RepositoryException(
        origin: e,
        handler: exceptionHandler,
        operatorType: RepositoryOperatorType.R,
        inputData: {id: id},
      );
    } catch (e) {
      throw RepositoryException(origin: e as Exception, inputData: {id: id});
    }
  }

  @override
  Future<void> delete(int id) {
    // TODO: implement delete
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
