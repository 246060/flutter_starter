import "package:dio/dio.dart";
import "package:flutter_starter/common/exceptions/exception_handler.dart";
import "package:flutter_starter/common/repositories/repository_error_message.dart";
import "package:flutter_starter/common/repositories/repository_exception.dart";
import "package:flutter_starter/common/repositories/sample/user.dart";
import "package:flutter_starter/common/repositories/sample/user_repository.dart";

class HttpUserRepository extends UserRepository {
  HttpUserRepository({required this.dio, required this.exceptionHandler});

  final Dio dio;
  final ExceptionHandler exceptionHandler;

  @override
  Future<User> findById(int id) async {
    try {
      final res = await dio
          .get<Map<String, dynamic>>("https://reqres.in/api/users/$id");

      return User.fromJson(res.data?["data"] as Map<String, dynamic>);
    } on DioError catch (e) {
      throw DioRepositoryException(
        origin: e,
        errorMessage: RepositoryErrorMessage.read(inputData: "user_id($id)"),
      );
    } on Exception catch (e) {
      throw DioRepositoryException(origin: e);
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
