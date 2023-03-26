import 'package:dio/dio.dart';
import 'package:flutter_starter/common/configs/config.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'sample_repository_test.mocks.dart';

final log = getLogger();

class SampleRepository {
  SampleRepository(this.dio);

  final Dio dio;

  Future<String> token() async {
    final response =
        await dio.get<Map<String, dynamic>>('https://reqres.in/api/users/1');
    return response.data?['token'] as String;
  }
}

@GenerateMocks([Dio])
void main() {
  late final dio = MockDio();
  late final repo;

  setUp(() {
    // we can now pass in Dio as an argument
    repo = SampleRepository(dio);
  });

  group('sample repository', () {
    test('return token', () async {
      // given
      when(
        dio.get<Map<String, dynamic>>('https://reqres.in/api/users/1'),
      ).thenAnswer(
        (_) async => Future.value(
          Response(
            statusCode: 200,
            data: {'token': 'ASjwweiBE'},
            requestOptions:
                RequestOptions(path: 'https://reqres.in/api/users/1'),
          ),
        ),
      );

      // when
      final token = await repo.token();

      // then
      expect(token, 'ASjwweiBE');
    });
  });
}
