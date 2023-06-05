import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flavor/state/user_state_notifier.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final userNotifier = ref.watch(userStateNotifierProvider.notifier);
    // final user = ref.watch(userStateNotifierProvider);

    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                const Text('home'),
                // Text('${ref.watch(userStateNotifierProvider).value!.id}'),
                // ElevatedButton(
                //     onPressed: () => ref
                //         .watch(userStateNotifierProvider.notifier)
                //         .increment(),
                //     child: const Text('increase')),
                // Text(ref.watch(userStateNotifierProvider).value!.name),
                // ElevatedButton(
                //     onPressed: () => ref
                //         .watch(userStateNotifierProvider.notifier)
                //         .setUser(id: 0, email: ''),
                //     child: const Text('setUser')),
                // Text(ref.watch(userStateNotifierProvider).value?.email ?? ''),
                // ElevatedButton(
                //     onPressed: () => ref
                //         .watch(userStateNotifierProvider.notifier)
                //         .setEmail('mail!!!'),
                //     child: const Text('setEmail')),

                ref.watch(userStateNotifierProvider).when(
                      data: (data) => Column(children: [
                        Text(
                            '${ref.watch(userStateNotifierProvider).value!.id}'),
                        ElevatedButton(
                            onPressed: () => ref
                                .watch(userStateNotifierProvider.notifier)
                                .increment(),
                            child: const Text('increase')),
                        Text(ref.watch(userStateNotifierProvider).value!.name),
                        ElevatedButton(
                            onPressed: () => ref
                                .watch(userStateNotifierProvider.notifier)
                                .setUser(id: 0, email: ''),
                            child: const Text('setUser')),
                        Text(
                            ref.watch(userStateNotifierProvider).value?.email ??
                                ''),
                        ElevatedButton(
                            onPressed: () => ref
                                .watch(userStateNotifierProvider.notifier)
                                .setEmail('mail!!!'),
                            child: const Text('setEmail')),
                        Text('Name: ${data.name}'),
                      ]),
                      loading: () => CircularProgressIndicator(),
                      error: (error, stackTrace) => Text('Error: $error'),
                    ),
                // Text(ref.watch(userStateNotifierProvider).value?.email ?? ''),
                ElevatedButton(
                    onPressed: () => ref
                        .watch(userStateNotifierProvider.notifier)
                        .fetchDataAndUpdateUser(),
                    child: const Text('setEmail')),
              ],
            ),
          ),
        ));
  }
}
