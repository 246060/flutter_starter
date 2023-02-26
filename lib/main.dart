import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';
import 'common/configs/config.dart';

final log = getLogger();

void main() {
  log.i("main start...");

  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    // 추가 비동기 작업

    runApp(ProviderScope(observers: [ProviderLogger()], child: const MyApp()));

  }, (error, stack) {
    log.e("", error, stack);
  });
}
