import 'package:logger/logger.dart';

final log = getLogger();

class SimpleLogPrinter extends LogPrinter {
  SimpleLogPrinter(this.className);

  final String className;

  @override
  List<String> log(LogEvent event) {
    final emoji = PrettyPrinter.levelEmojis[event.level];
    final prefix = '[${DateTime.now()}][$className][${event.level}]';
    return ['$prefix $emoji ${event.message.toString()}'];
  }
}

Logger getLogger() => Logger(
      printer: PrettyPrinter(
        methodCount: 30,
        printTime: true,
      ),
    );

class SimplePrinterEx extends SimplePrinter{

  SimplePrinterEx(this.className);

  final String className;

  @override
  List<String> log(LogEvent event) {
    final msg = super.log(event);
    return [className, ...msg];
  }
}
//Logger getLogger() => Logger(printer: SimplePrinter(printTime: true));
