import 'package:logger/logger.dart';

final log = getLogger();

Logger getLogger() {
  return Logger(printer: PrettyPrinter(methodCount: 1));
}
