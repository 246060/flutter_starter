import 'package:logger/logger.dart';

class SimpleLogPrinter extends LogPrinter {
  SimpleLogPrinter({required String className, required String layer})
      : _className = className,
        _layer = layer.padRight(15);

  final String _className;
  final String _layer;

  @override
  List<String> log(LogEvent event) {
    final message = event.message;
    final errorStr = event.error != null ? '  ERROR: ${event.error}' : '';
    final timeStr = event.time.toUtc().toString().padRight(30);
    final stackTrace =
        event.stackTrace != null ? '  STACKTRACE: ${event.stackTrace}' : '';

    final color = PrettyPrinter.levelColors[event.level];
    final emoji = PrettyPrinter.levelEmojis[event.level];

    final prefix = '$emoji[$_layer][$timeStr][${_className.padRight(30)}]';

    return [color!('$prefix : $message$errorStr$stackTrace')];
  }
}
