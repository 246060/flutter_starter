import 'package:flutter_starter/core/configs/logger_config.dart';
import 'package:flutter_starter/domain/usecases/usecase.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() async {});

  group('sample group', () {
    test('sample test 1', () {
      final doLoginUseCase = DoLoginUseCase();

      final result0 = doLoginUseCase(Login()).when(
        (success) => log.i('success'),
        (error) => log.i('error'),
      );
    });
  });
}
