import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter/domain/entities/user/user.dart';



class AsyncLoginProvider extends AsyncNotifier<int> {
  Future<int> _fetchTodo() async {
    await Future<void>.delayed(const Duration(seconds: 1));
    return 0;
  }

  @override
  Future<int> build() async => _fetchTodo();

  Future<void> doLogin(User user) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await Future<void>.delayed(const Duration(seconds: 1));
      return _fetchTodo();
    });
  }
}
