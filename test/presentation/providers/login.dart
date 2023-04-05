import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter/core/configs/logger_config.dart';
import 'package:flutter_starter/core/error/failure/failure.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:multiple_result/multiple_result.dart';

final abProvider = AsyncNotifierProvider<AbNotifier, int>(AbNotifier.new);

Result<int, Failure> doSomething({required int next}) {
  if (next == 0) {
    log.i('doSomething>Success');
    return const Success(0);
  } else if (next == 1) {
    log.i('doSomething>serverError');
    return Error(Failure.serverError());
  } else if (next == 2) {
    log.i('doSomething>networkError');
    return Error(Failure.networkError());
  } else {
    log.i('doSomething>tokenExpired');
    return Error(Failure.tokenExpired());
  }
}

class AbNotifier extends AsyncNotifier<int> {
  @override
  FutureOr<int> build() => 0;

  Future<void> action({required int next}) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final result = doSomething(next: next);
      return result.when(
        (success) => success,
        (error) {
          log.i(error);
          throw error;
        },
      );
    });
  }
}

class Listener<T> extends Mock {
  void call(T? previous, T value);
}

// @GenerateMocks([Listener])
void main() {
  setUp(() async {});

  setUpAll(() {
    registerFallbackValue(const AsyncLoading<int>());
  });

  group('sample group', () {
    test('sample test 1', () async {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final listener = Listener<AsyncValue<int>>();

      container.listen(abProvider, listener.call, fireImmediately: true);

      const data = AsyncData<int>(0);

      final mv = container.read(abProvider.notifier);
      final result = await mv.action(next: 3);

      verifyInOrder([
        () => listener(null, data),
        () => listener(data, any(that: isA<AsyncLoading<int>>())),
        () => listener(
              any(that: isA<AsyncLoading<int>>()),
              any(that: isA<AsyncError<int>>()),
            ),
      ]);

      verifyNoMoreInteractions(listener);
    });
  });
}
