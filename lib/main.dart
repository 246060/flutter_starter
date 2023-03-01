import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';
import 'common/configs/config.dart';

final log = getLogger();

void main() {
  log.i("flutter main function started...");

  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    // 작업 추가 할 영역...

    runApp(ProviderScope(observers: [ProviderLogger()], child: const MyApp()));

  }, (error, stack) {
    log.e("", error, stack);
  });
}
