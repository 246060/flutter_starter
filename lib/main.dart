import "dart:async";

import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_starter/app.dart";
import "package:flutter_starter/common/configs/config.dart";

Future<void> main() async {
  log.i("flutter main function started...");

  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    // 작업 추가 할 영역...

    runApp(ProviderScope(observers: [ProviderLogger()], child: const MyApp()));
  }, (error, stack) {
    log.e("", error, stack);
  });
}
