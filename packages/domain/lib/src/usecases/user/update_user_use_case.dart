import 'package:app_common/src/error/failure/failure.dart';
import 'package:multiple_result/src/result.dart';

import '../../config/logger_generator.dart';
import '../../models/dto/user/use_case/update_user_uc_in.dart';
import '../../models/dto/user/use_case/update_user_uc_out.dart';
import '../../repositories/user_repository.dart';
import '../use_case.dart';

class UpdateUserUseCase implements UseCase<UpdateUserUcIn, UpdateUserUcOut> {
  UpdateUserUseCase({required IUserRepository userRepository})
      : _userRepository = userRepository;

  final _log = LoggerGenerator('UpdateUserUseCase').getLogger();
  final IUserRepository _userRepository;

  @override
  Future<Result<UpdateUserUcOut, Failure>> call(UpdateUserUcIn inDto) async {
    _log.i('$inDto');
    await Future<void>.delayed(const Duration(seconds: 1));
    final outDto = UpdateUserUcOut();
    _log.i('$outDto');
    return Success(outDto);
  }
}
