import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flavor/pages/alert_dialogue.dart';
import 'package:test_flavor/providers/repository/get_test_notifier.dart';
import 'package:test_flavor/providers/repository/get_user_notifier.dart';
import 'package:test_flavor/providers/state/test_state_notifier.dart';
import 'package:test_flavor/providers/state/user_info_state_notifier.dart';

class SecondPage extends ConsumerWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(getTestNotifierProvider);
    final test = ref.watch(testStateNotifierProvider);
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Column(children: [
            ref.watch(getTestNotifierProvider).when(
                data: (data) => Center(
                      child: Column(
                        children: [
                          Text('third'),
                          Text(test.name),
                        ],
                      ),
                    ),
                loading: () => CircularProgressIndicator(),
                error: (error, stackTrace) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    showDialog(
                        context: context,
                        builder: (_) => NetworkErrorDialogue(errorCode: error));
                  });

                  return Text('データの取得に失敗しました。');
                }),
            ElevatedButton(
                onPressed: () async =>
                    ref.invalidate(testStateNotifierProvider),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                ),
                child: const Text('refresh!')),
            ElevatedButton(
                onPressed: () async => ref
                    .watch(testStateNotifierProvider.notifier)
                    .setUser(id: 999, name: 'geted_name', email: ''),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                ),
                child: const Text('change!')),
          ]),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:test_flavor/pages/alert_dialogue.dart';
// import 'package:test_flavor/providers/repository/get_user_notifier.dart';

// class SecondPage extends ConsumerStatefulWidget {
//   const SecondPage({super.key});

//   @override
//   ConsumerState<SecondPage> createState() => _SecondPageState();
// }

// class _SecondPageState extends ConsumerState<SecondPage> {
//   @override
//   void initState() {
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       ref.read(getUserNotifierProvider.notifier).fetchDataAndUpdateUser();
//     });
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: SafeArea(
//         child: ref.watch(getUserNotifierProvider).when(
//             data: (data) => Center(
//                   child: Column(
//                     children: [Text('third')],
//                   ),
//                 ),
//             loading: () => CircularProgressIndicator(),
//             error: (error, stackTrace) {
//               WidgetsBinding.instance.addPostFrameCallback((_) {
//                 showDialog(
//                     context: context,
//                     builder: (_) => NetworkErrorDialogue(errorCode: error));
//               });

//               return Text('データの取得に失敗しました。');
//             }),
//       ),
//     );
//   }
// }
