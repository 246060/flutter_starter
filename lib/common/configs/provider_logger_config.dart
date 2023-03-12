import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_starter/common/configs/config.dart";

class ProviderLogger extends ProviderObserver {
  factory ProviderLogger() => _instance;

  ProviderLogger._();

  static final _instance = ProviderLogger._();

  @override
  void didUpdateProvider(
    ProviderBase<dynamic> provider,
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
