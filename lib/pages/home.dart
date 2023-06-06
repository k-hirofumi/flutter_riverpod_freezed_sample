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
    final overlay = LoadingOverlay.of(context);

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

                ElevatedButton(
                    onPressed: () async => await overlay
                        .during(Future.delayed(const Duration(seconds: 2))),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                    ),
                    child: const Text('send!')),
              ],
            ),
          ),
        ));
  }
}

class LoadingOverlay {
  BuildContext _context;

  void hide() {
    Navigator.of(_context).pop();
  }

  void show() {
    showDialog(
        context: _context,
        barrierDismissible: false,
        builder: (ctx) => _FullScreenLoader());
  }

  Future<T> during<T>(Future<T> future) {
    show();
    return future.whenComplete(() => hide());
  }

  LoadingOverlay._create(this._context);

  factory LoadingOverlay.of(BuildContext context) {
    return LoadingOverlay._create(context);
  }
}

class _FullScreenLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.5)),
        child: const Center(child: CircularProgressIndicator()));
  }
}
