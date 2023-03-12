import "package:logger/logger.dart";

final log = getLogger();

Logger getLogger() => Logger(printer: PrettyPrinter(methodCount: 1));
