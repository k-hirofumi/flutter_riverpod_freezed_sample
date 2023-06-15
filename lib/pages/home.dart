import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flavor/components/alert_dialogue.dart';
import 'package:test_flavor/providers/repository/get_user_notifier.dart';
import 'package:test_flavor/providers/repository/update_user_notifier.dart';
import 'package:test_flavor/providers/state/user_info_state_notifier.dart';
import 'package:test_flavor/utils/loading_overlay.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userStateNotifierProvider);

    final overlay = LoadingOverlay(context);
    final reload = () async {
      overlay
          .during(ref.watch(updateUserNotifierProvider.notifier).updateUser());
    };
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
                    onPressed: () async => reload(),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.yellow),
                    ),
                    child: const Text('send!2')),
              ],
            ),
          ),
        ));
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