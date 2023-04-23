import 'dart:io';

import 'package:logger/logger.dart';

class FileLogOutput extends LogOutput {
  FileLogOutput({this.filePath});

  final String? filePath;
  late final File file;

  @override
  void init() {
    super.init();
    if (filePath != null) {
      file = File(filePath!);
    }
  }

  @override
  void output(OutputEvent event) {
    // ignore: unnecessary_null_comparison
    if (file != null) {
      for (var line in event.lines) {
        file.writeAsString("${line.toString()}\n",
            mode: FileMode.writeOnlyAppend);
      }
    } else {
      for (var line in event.lines) {
        // ignore: avoid_print
        print(line);
      }
    }
  }
}
