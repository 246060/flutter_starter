import "dart:async";

import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_starter/app.dart";
import "package:flutter_starter/common/configs/config.dart";
import "package:hive_flutter/adapters.dart";

Future<void> main() async {
  log.i("flutter main function started...");

  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Hive.initFlutter();
    final sampleBox =
        await Hive.openBox<Map<dynamic, dynamic>>("flutter_starter");
    log.i("Hive Path: ${sampleBox.path}");

    runApp(
      ProviderScope(
        observers: [
          ProviderLogger(),
        ],
        child: const MyApp(),
      ),
    );
  }, (error, stack) {
    Hive.close();
    log.e("", error, stack);
  });
}
