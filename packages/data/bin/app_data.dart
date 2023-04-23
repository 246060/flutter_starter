import 'package:app_data/src/config/logger_generator.dart';
import 'package:app_data/src/repository/user_repository.dart';
import 'package:app_domain/domain.dart';
import 'package:dio/dio.dart';

Future<void> main() async {

  final log = LoggerGenerator('main').getLogger();
  final dio = Dio();

  dio.interceptors.add(LogInterceptor(responseBody: true, logPrint: log.d));

  final userRepository = UserRepository(dio: dio);
  final outDto = await userRepository.getById(GetUserRpIn(id: 1));

  // await userRepository.create(User(
  //   firstName: 'morpheus',
  //   lastName: 'jack',
  //   email: 'jack@test.com',
  //   avatar: 'http://img.test.com/sdlkfjsdf',
  // ));

}
