import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_starter/app.dart';
import 'package:flutter_starter/core/configs/logger_config.dart';
import 'package:flutter_starter/core/configs/provider_logger_config.dart';

Future<void> main() async {
  log.i('flutter main function started...');

  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    runApp(
      ProviderScope(
        observers: [ProviderLogger()],
        child: const App(),
      ),
    );
  }, (error, stack) {
    log.e('error at runZonedGuarded', error, stack);
  });
}
