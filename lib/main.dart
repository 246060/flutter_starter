import 'dart:async';

import 'package:app_common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'src/app.dart';
import 'src/configs/provider_logger_config.dart';

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
