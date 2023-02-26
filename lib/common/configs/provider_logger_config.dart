import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'config.dart';

final log = getLogger();

class ProviderLogger extends ProviderObserver {
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
