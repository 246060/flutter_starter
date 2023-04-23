import 'dart:io';

import 'package:app_common/src/logger_generator.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    final directory = await Directory.systemTemp.createTemp();

    const MethodChannel('plugins.flutter.io/path_provider')
        .setMockMethodCallHandler((MethodCall methodCall) async {
      switch (methodCall.method) {
        case 'getApplicationDocumentsDirectory':
          return directory.path;
        default:
      }
    });
  });

  test('TEST-1', () async {
    final log = LoggerGenerator('MAIN TEST').getLogger();
    final Directory tempDir = await getApplicationDocumentsDirectory();
    log.i(tempDir.path);
  });
}
