import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nameProvider = Provider<String>((ref) => "Kapil R Singh");

class ProviderWithStateFull extends ConsumerStatefulWidget {
  const ProviderWithStateFull({Key? key}) : super(key: key);

  @override
  ConsumerState<ProviderWithStateFull> createState() => _ProviderWithStateFullState();
}

class _ProviderWithStateFullState extends ConsumerState<ProviderWithStateFull> {
  @override
  void initState() {
    super.initState();
    final name = ref.read(nameProvider);
    print("name : $name");
  }

  @override
  Widget build(BuildContext context) {
    final name = ref.watch(nameProvider);
    return Scaffold(
      appBar: AppBar(title: const Text("Provider")),
      body: Center(
        child: Text("Hi, $name"),
      ),
    );
  }
}
