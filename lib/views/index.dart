import 'package:flutter/material.dart';

import '../state_notifier_provider/state_notifier_provider_sl.dart';
import 'future_provider_sl.dart';
import 'provider_sf.dart';
import 'provider_sl.dart';
import 'state_provider_sl.dart';
import 'stream_provider_sl.dart';

class Index extends StatelessWidget {
  const Index({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("RiverPod")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: const Text("Provider with SL"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProviderSL()),
                );
              },
            ),
            ListTile(
              title: const Text("Provider with SF"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProviderSF()),
                );
              },
            ),
            ListTile(
              title: const Text("State provider"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const StateProviderSL()),
                );
              },
            ),
            ListTile(
              title: const Text("State notifier provider"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const StateNotifierProviderSL()),
                );
              },
            ),
            ListTile(
              title: const Text("Future provider"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FutureProviderSL()),
                );
              },
            ),
            ListTile(
              title: const Text("Stream provider"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const StreamProviderSL()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
