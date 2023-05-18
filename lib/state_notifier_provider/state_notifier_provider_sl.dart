import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'counter_demo.dart';

final counterProvider = StateNotifierProvider.autoDispose<CounterDemo, int>((ref) {
  final link = ref.keepAlive();
  final timer = Timer(const Duration(seconds: 10), () {
    link.close();
  });

  ref.onDispose(() => timer.cancel());
  return CounterDemo();
});

class StateNotifierProviderSL extends ConsumerWidget {
  const StateNotifierProviderSL({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);

    ref.listen(counterProvider, (previous, next) {
      if (next == 10) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("This value is $next")),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(title: const Text("State Notifier Provider")),
      body: Container(
        padding: const EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "$count",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    ref.read(counterProvider.notifier).increment();
                  },
                  child: const Icon(Icons.add),
                ),
                const SizedBox(width: 24),
                ElevatedButton(
                  onPressed: () {
                    /// Way 1
                    // ref.invalidate(counterProvider);

                    /// Way 2
                    ref.refresh(counterProvider);
                  },
                  child: const Icon(Icons.refresh),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
