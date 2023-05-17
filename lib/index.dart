import 'package:flutter/material.dart';

import 'provider_with_statefull.dart';
import 'provider_with_stateless.dart';
import 'state_provider_with_stateless.dart';

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
                  MaterialPageRoute(builder: (context) => const ProviderWithStateless()),
                );
              },
            ),
            ListTile(
              title: const Text("Provider with SF"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProviderWithStateFull()),
                );
              },
            ),
            ListTile(
              title: const Text("State provider"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const StateProviderWithStateless()),
                );
              },
            ),
            ListTile(
              title: const Text("State notifier provider"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const StateProviderWithStateless()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
