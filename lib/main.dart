import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'src/app.dart';
import 'src/config/logger_generator.dart';
import 'src/config/provider_logger_config.dart';

Future<void> main() async {
  final log = LoggerGenerator('main').getLogger();

  await runZonedGuarded(() async {
    log.i('flutter main function started...');
    WidgetsFlutterBinding.ensureInitialized();

    runApp(
      ProviderScope(
        observers: [ProviderLogger()],
        child: App(),
      ),
    );
  }, (error, stack) {
    log.e('error at runZonedGuarded', error, stack);
  });
}
