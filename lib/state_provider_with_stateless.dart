import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateProvider<int>((ref) => 0);

class StateProviderWithStateless extends ConsumerWidget {
  const StateProviderWithStateless({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);

    ref.listen(counterProvider, (previous, next) {
      if (next == 5) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("This value is $next")),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(title: const Text("State Provider With Stateless")),
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
                    /// Way 1
                    //ref.read(counterProvider.notifier).state++;

                    /// Way 2
                    ref.read(counterProvider.notifier).update((state) => state + 1);
                  },
                  child: const Icon(Icons.add),
                ),
                const SizedBox(width: 24),
                ElevatedButton(
                  onPressed: () {
                    /// Way 1
                    //ref.invalidate(counterProvider);

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
