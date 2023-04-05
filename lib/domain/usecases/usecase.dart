import 'package:flutter_starter/core/error/failure/failure.dart';
import 'package:flutter_starter/domain/entities/user/user.dart';
import 'package:multiple_result/multiple_result.dart';

class Login {}

mixin UseCase<T> {
  Result<dynamic, dynamic> call(T t);
}

class DoLoginUseCase implements UseCase<Login> {
  @override
  Result<User, Failure> call(Login login) =>
      Success(User(id: 1, avatar: '', lastName: '', firstName: '', email: ''));
}
