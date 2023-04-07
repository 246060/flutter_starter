import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final asyncSampleProvider = AsyncNotifierProvider<AsyncSampleProvider, int>(
  AsyncSampleProvider.new,
);

class AsyncSampleProvider extends AsyncNotifier<int> {
  @override
  FutureOr<int> build() => 0;

  Future<void> incrementCounter() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await Future<void>.delayed(const Duration(seconds: 1));
      return state.requireValue + 1;
    });
  }
}
