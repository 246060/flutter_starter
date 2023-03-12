import "package:dio/dio.dart";
import "package:flutter_starter/common/exceptions/exception_handler.dart";
import "package:flutter_starter/common/repositories/repository_error_message.dart";
import "package:flutter_starter/common/repositories/repository_exception.dart";
import "package:flutter_starter/common/repositories/sample/user.dart";
import "package:flutter_starter/common/repositories/sample/user_repository.dart";

class HttpUserRepository extends UserRepository {
  HttpUserRepository({required Dio dio, required this.exceptionHandler})
      : _dio = dio;

  final Dio _dio;
  final ExceptionHandler exceptionHandler;

  @override
  Future<User> findById(int id) async {
    try {
      final res = await _dio
          .get<Map<String, dynamic>>("https://reqres.in/api/users/$id");
      return User.fromJson(res.data?["data"] as Map<String, dynamic>);
    } on DioError catch (e) {
      throw RepositoryException(
        origin: e,
        handler: exceptionHandler,
        operatorType: RepositoryOperatorType.R,
        inputData: {id: id},
      );
    } on Exception catch (e) {
      throw RepositoryException(origin: e, inputData: {id: id});
    }
  }

  @override
  Future<void> delete(int id) {
    // TODO(blackcocoon): implement delete
    throw UnimplementedError();
  }

  @override
  Future<void> save(User user) {
    // TODO(blackcocoon): implement delete
    throw UnimplementedError();
  }

  @override
  Future<void> update(User user) {
    // TODO(blackcocoon): implement delete
    throw UnimplementedError();
  }
}
