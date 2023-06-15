import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flavor/pages/alert_dialogue.dart';
import 'package:test_flavor/pages/second.dart';
import 'package:test_flavor/providers/repository/get_user_notifier.dart';
import 'package:test_flavor/providers/state/user_info_state_notifier.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final userNotifier = ref.watch(userStateNotifierProvider.notifier);
    // final user = ref.watch(userStateNotifierProvider);
    final user = ref.watch(userStateNotifierProvider);
    // final getUser = ref.watch(getUserInfoNotifierProvider.notifier);
    final overlay = LoadingOverlay(context);
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

                // ref.watch(userStateNotifierProvider).when(
                //       data: (data) => Column(children: [
                //         Text(
                //             '${ref.watch(userStateNotifierProvider).value!.id}'),
                //         ElevatedButton(
                //             onPressed: () => ref
                //                 .watch(userStateNotifierProvider.notifier)
                //                 .increment(),
                //             child: const Text('increase')),
                //         Text(ref.watch(userStateNotifierProvider).value!.name),
                //         ElevatedButton(
                //             onPressed: () => ref
                //                 .watch(userStateNotifierProvider.notifier)
                //                 .setUser(id: 0, email: ''),
                //             child: const Text('setUser')),
                //         Text(
                //             ref.watch(userStateNotifierProvider).value?.email ??
                //                 ''),
                //         ElevatedButton(
                //             onPressed: () => ref
                //                 .watch(userStateNotifierProvider.notifier)
                //                 .setEmail('mail!!!'),
                //             child: const Text('setEmail')),
                //         Text('Name: ${data.name}'),
                //       ]),
                //       loading: () => CircularProgressIndicator(),
                //       error: (error, stackTrace) => Text('Error: $error'),
                //     ),
                // // Text(ref.watch(userStateNotifierProvider).value?.email ?? ''),
                // ElevatedButton(
                //     onPressed: () => ref
                //         .watch(userStateNotifierProvider.notifier)
                //         .fetchDataAndUpdateUser(),
                //     child: const Text('setEmail')),

                // ElevatedButton(
                //     onPressed: () async => await overlay
                //         .during(Future.delayed(const Duration(seconds: 2))),
                //     style: ButtonStyle(
                //       backgroundColor: MaterialStateProperty.all(Colors.red),
                //     ),
                //     child: const Text('send!')),
                // ElevatedButton(
                //     onPressed: () async => ref.invalidate(getUserInfoNotifierProvider),
                //     style: ButtonStyle(
                //       backgroundColor: MaterialStateProperty.all(Colors.red),
                //     ),
                //     child: const Text('refresh!')),

                ref.watch(getUserNotifierProvider).when(
                    data: (data) => Column(children: [
                          Text(user.name ?? ''),
                        ]),
                    loading: () => CircularProgressIndicator(),
                    error: (error, stackTrace) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        showDialog(
                            context: context,
                            builder: (_) =>
                                NetworkErrorDialogue(errorCode: error));
                      });

                      return Text('データの取得に失敗しました。');
                    }),
                ElevatedButton(
                    onPressed: () => ref
                        .watch(getUserNotifierProvider.notifier)
                        .fetchDataAndUpdateUser(),
                    child: const Text('setUser')),
                ElevatedButton(
                    onPressed: () async =>
                        ref.invalidate(userStateNotifierProvider),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                    ),
                    child: const Text('refresh!')),
                ElevatedButton(
                    onPressed: () async => await overlay.during(ref
                        .watch(getUserNotifierProvider.notifier)
                        .fetchDataAndUpdateUser()),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                    ),
                    child: const Text('send!')),
                ElevatedButton(
                  onPressed: () {
                    // （1） 指定した画面に遷移する
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            // （2） 実際に表示するページ(ウィジェット)を指定する
                            builder: (context) => SecondPage()));
                  },
                  child: const Text('SecondPage'),
                )
              ],
            ),
          ),
        ));
  }
}

class LoadingOverlay {
  LoadingOverlay(this.context);
  BuildContext context;

  void hide() {
    Navigator.of(context).pop();
  }

  void show() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (ctx) => _FullScreenLoader());
  }

  Future<T> during<T>(Future<T> future) {
    show();
    return future.whenComplete(() => hide());
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


// class LoadingOverlay extends StatelessWidget {
//   final bool isLoading;
//   final Widget child;

//   LoadingOverlay({required this.isLoading, required this.child});

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         child,
//         if (isLoading)
//           Container(
//             color: Colors.black54,
//             child: Center(
//               child: CircularProgressIndicator(),
//             ),
//           ),
//       ],
//     );
//   }
// }