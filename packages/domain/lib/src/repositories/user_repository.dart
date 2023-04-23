import '../models/dto/user/repo/create_user_rp_in.dart';
import '../models/dto/user/repo/create_user_rp_out.dart';
import '../models/dto/user/repo/delete_user_rp_in.dart';
import '../models/dto/user/repo/delete_user_rp_out.dart';
import '../models/dto/user/repo/get_user_rp_in.dart';
import '../models/dto/user/repo/get_user_rp_out.dart';
import '../models/dto/user/repo/update_user_rp_in.dart';
import '../models/dto/user/repo/update_user_rp_out.dart';

abstract class IUserRepository {
  Future<GetUserRpOut> getById(GetUserRpIn inDto);
  Future<CreateUserRpOut> create(CreateUserRpIn inDto);
  Future<UpdateUserRpOut> update(UpdateUserRpIn inDto);
  Future<DeleteUserRpOut> delete(DeleteUserRpIn inDto);
}
