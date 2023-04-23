import 'package:app_domain/domain.dart';
import 'package:app_domain/src/models/dto/user/use_case/get_user_list_uc_in.dart';
import 'package:app_domain/src/usecases/user/create_user_use_case.dart';
import 'package:app_domain/src/usecases/user/delete_user_use_case.dart';
import 'package:app_domain/src/usecases/user/get_user_list_use_case.dart';
import 'package:app_domain/src/usecases/user/get_user_use_case.dart';
import 'package:app_domain/src/usecases/user/update_user_use_case.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('TEST', () async {
    final repo = FakeUserRepository();

    final useCase0 = GetUserUseCase(userRepository: repo);
    final useCase1 = GetUserListUseCase(userRepository: repo);
    final useCase2 = CreateUserUseCase(userRepository: repo);
    final useCase3 = UpdateUserUseCase(userRepository: repo);
    final useCase4 = DeleteUserUseCase(userRepository: repo);

    final result0 = await useCase0(GetUserUcIn());
    final result1 = await useCase1(GetUserListUcIn());
    final result2 = await useCase2(CreateUserUcIn());
    final result3 = await useCase3(UpdateUserUcIn());
    final result4 = await useCase4(DeleteUserUcIn());
  });
}

class FakeUserRepository implements IUserRepository {
  @override
  Future<CreateUserRpOut> create(CreateUserRpIn inDto) {
    throw UnimplementedError();
  }

  @override
  Future<DeleteUserRpOut> delete(DeleteUserRpIn inDto) {
    throw UnimplementedError();
  }

  @override
  Future<GetUserRpOut> getById(GetUserRpIn inDto) {
    throw UnimplementedError();
  }

  @override
  Future<UpdateUserRpOut> update(UpdateUserRpIn inDto) {
    throw UnimplementedError();
  }
}
