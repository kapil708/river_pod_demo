import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final streamProvider = StreamProvider<int>((ref) {
  return Stream.periodic(const Duration(seconds: 2), ((count) => count));
});

class StreamProviderSL extends ConsumerWidget {
  const StreamProviderSL({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final streamData = ref.watch(streamProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Stream Provider")),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: streamData.when(
          data: (data) {
            return Center(child: Text(data.toString(), style: const TextStyle(fontSize: 34)));
          },
          error: ((e, s) {
            return Text(
              "$e, $s",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).colorScheme.error,
                  ),
            );
          }),
          loading: (() {
            return const Center(child: CircularProgressIndicator());
          }),
        ),
      ),
    );
  }
}
