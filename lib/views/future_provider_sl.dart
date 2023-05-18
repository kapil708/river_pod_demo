import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_pod_demo/api_service.dart';
import 'package:river_pod_demo/models/user_model.dart';

//final nameProvider = Provider<String>((ref) => "Kapil R Singh");

final apiProvider = Provider<ApiService>((ref) => ApiService());
final userDataProvider = FutureProvider<List<UserModel>>((ref) {
  return ref.read(apiProvider).getUser();
});

class FutureProviderSL extends ConsumerWidget {
  const FutureProviderSL({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(userDataProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Provider With Stateless")),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: userData.when(
          data: (data) {
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: ((context, index) {
                return ListTile(
                  title: Text("${data[index].firstName} ${data[index].lastName}"),
                  subtitle: Text(data[index].email),
                  leading: CircleAvatar(child: Image.network(data[index].avatar)),
                );
              }),
            );
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
