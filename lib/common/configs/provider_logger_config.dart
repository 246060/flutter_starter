import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'config.dart';

class ProviderLogger extends ProviderObserver {

  ProviderLogger._();

  static final _instance = ProviderLogger._();

  factory ProviderLogger(){
    return _instance;
  }

  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    log.i({
      provider: provider.name ?? provider.runtimeType,
      newValue: newValue,
    });
  }
}
