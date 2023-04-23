import 'package:multiple_result/src/result.dart';

import '../../config/logger_generator.dart';
import '../../exceptions/exception_handler.dart';
import '../../exceptions/failure.dart';
import '../../models/dto/user/use_case/delete_user_uc_in.dart';
import '../../models/dto/user/use_case/delete_user_uc_out.dart';
import '../../repositories/user_repository.dart';
import '../use_case.dart';

class DeleteUserUseCase implements UseCase<DeleteUserUcIn, DeleteUserUcOut> {
  DeleteUserUseCase({required IUserRepository userRepository})
      : _userRepository = userRepository;

  final _log = LoggerGenerator('DeleteUserUseCase').getLogger();
  final IUserRepository _userRepository;

  @override
  Future<Result<DeleteUserUcOut, Failure>> call(DeleteUserUcIn inDto) async {
    try {
      _log.i('$inDto');

      await Future<void>.delayed(const Duration(seconds: 1));
      final outDto = DeleteUserUcOut();

      _log.i('$outDto');
      return Success(outDto);
    } on Exception catch (ex) {
      return Error(ExceptionHandler().handle(ex));
    }
  }
}
