import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flavor/components/alert_dialog.dart';
import 'package:test_flavor/components/custom_app_bar.dart';
import 'package:test_flavor/navigators/home_navigator.dart';
import 'package:test_flavor/navigators/main_navigator.dart';
import 'package:test_flavor/pages/forth.dart';
import 'package:test_flavor/pages/second.dart';
import 'package:test_flavor/pages/third.dart';
import 'package:test_flavor/providers/repository/get_user_notifier.dart';
import 'package:test_flavor/providers/repository/update_user_notifier.dart';
import 'package:test_flavor/providers/state/user_info_state_notifier.dart';
import 'package:test_flavor/utils/loading_handler.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: CustomAppBar(
          title: 'home',
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                Text(
                  'home',
                  style: TextStyle(
                    fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize,
                    color: Colors.red,
                  ),
                ),

                ref.watch(getUserNotifierProvider).when(
                    data: (data) {
                      final user = ref.watch(userStateNotifierProvider);

                      return Column(children: [
                        Text(user.name ?? ''),
                      ]);
                    },
                    loading: () => CircularProgressIndicator(),
                    error: (error, stackTrace) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        showDialog(
                            context: context,
                            builder: (_) =>
                                NetworkErrorDialog(errorCode: error));
                      });

                      return Text('データが取得できませんでした。');
                    }),
                ElevatedButton(
                    onPressed: () => ref
                        .watch(getUserNotifierProvider.notifier)
                        .fetchDataAndUpdateUser(),
                    child: const Text('setUserAsync')),
                ElevatedButton(
                    onPressed: () => ref
                        .watch(userStateNotifierProvider.notifier)
                        .setUser(name: '!!!!!'),
                    child: const Text('setUser')),
                ElevatedButton(
                    onPressed: () async =>
                        ref.invalidate(userStateNotifierProvider),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                    ),
                    child: const Text('refresh!')),
                // ElevatedButton(
                //     onPressed: () async => reload(),
                //     style: ButtonStyle(
                //       backgroundColor: MaterialStateProperty.all(Colors.pink),
                //     ),
                //     child: const Text('send!2')),

                ElevatedButton(
                    onPressed: () async => HomeNavigator.toSecond(),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                    ),
                    child: const Text('second')),
                ElevatedButton(
                    onPressed: () async => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Third()),
                        ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.lightGreen),
                    ),
                    child: const Text('third')),
                ElevatedButton(
                    onPressed: () async => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Forth()),
                        ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.purple),
                    ),
                    child: const Text('forth')),
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