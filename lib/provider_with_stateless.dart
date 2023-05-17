import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nameProvider = Provider<String>((ref) => "Kapil R Singh");

class ProviderWithStateless extends ConsumerWidget {
  const ProviderWithStateless({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(nameProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Provider With Stateless")),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Way 1",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              "Hi $name",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 24),
            Text(
              "Way 2",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Consumer(builder: (context, ref1, child) {
              final name1 = ref1.watch(nameProvider);
              return Text(
                "Hi $name1",
                style: Theme.of(context).textTheme.titleLarge,
              );
            }),
          ],
        ),
      ),
    );
  }
}
