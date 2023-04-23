import 'package:app_common/common.dart';
import 'package:logger/logger.dart';

class LoggerGenerator {
  LoggerGenerator(String className) : _className = className;

  final String _className;

  Logger getLogger() =>
      Logger(printer: SimpleLogPrinter(className: _className, layer: 'DOMAIN'));
}
