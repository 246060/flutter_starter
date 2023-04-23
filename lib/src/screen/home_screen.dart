import 'package:easy_debounce/easy_debounce.dart';
import 'package:easy_debounce/easy_throttle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/sample_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  ConsumerState<HomeScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _incrementCounter() async {
    EasyThrottle.throttle('throttle1', const Duration(seconds: 1), () async {
      await ref.read(asyncSampleProvider.notifier).incrementCounter();
    });

    EasyDebounce.debounce('debounce1', const Duration(seconds: 1), () async {
      await ref.read(asyncSampleProvider.notifier).incrementCounter();
    });
  }

  @override
  Widget build(BuildContext context) {
    final asyncCount = ref.watch(asyncSampleProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: asyncCount.when(
          data: (data) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('You have pushed the button this many times:'),
              Text('$data', style: Theme.of(context).textTheme.headlineMedium),
            ],
          ),
          error: (err, stack) => Text('Error: $err'),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
