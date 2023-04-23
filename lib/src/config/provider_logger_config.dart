import 'package:app_common/common.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'logger_generator.dart';

class ProviderLogger extends ProviderObserver {
  factory ProviderLogger() => _instance;

  ProviderLogger._();

  static final _instance = ProviderLogger._();

  final _log = LoggerGenerator('ProviderLogger').getLogger();

  @override
  void didUpdateProvider(
    ProviderBase<dynamic> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    _log.i({
      provider: provider.name ?? provider.runtimeType,
      newValue: newValue,
    });
  }
}