import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flavor/components/alert_dialog.dart';
import 'package:test_flavor/components/custom_app_bar.dart';
import 'package:test_flavor/components/custom_button.dart';
import 'package:test_flavor/navigators/home_navigator.dart';
import 'package:test_flavor/navigators/main_navigator.dart';
import 'package:test_flavor/pages/text_area.dart';
import 'package:test_flavor/pages/forth.dart';
import 'package:test_flavor/pages/second.dart';
import 'package:test_flavor/pages/third.dart';
import 'package:test_flavor/providers/state/get_friend_info_state_notifier.dart';
import 'package:test_flavor/providers/repository/get_user_notifier.dart';
import 'package:test_flavor/providers/repository/update_user_notifier.dart';
import 'package:test_flavor/providers/state/user_info_state_notifier.dart';
import 'package:test_flavor/utils/loading_handler.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final overlay = LoadingHandler(context);
      overlay.background(
          ref.read(getUserNotifierProvider.notifier).fetchDataAndUpdateUser());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('home');
    return Scaffold(
      appBar: CustomAppBar(
        title: 'home_title',
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                Text(
                  'home',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.red,
                  ),
                ),
                ref.watch(getFriendStateNotifierProvider).when(
                    data: (data) {
                      final user = ref.watch(getFriendStateNotifierProvider);

                      return Column(children: [
                        // Text(user.name ?? ''),
                        Text('test'),
                      ]);
                    },
                    loading: () => CircularProgressIndicator(),
                    error: (error, stackTrace) {
                      // WidgetsBinding.instance.addPostFrameCallback((_) {
                      //   showDialog(
                      //       context: context,
                      //       builder: (_) =>
                      //           NetworkErrorDialog(errorCode: error));
                      // });

                      return Text('データが取得できませんでした。');
                    }),
                CustomButton(
                    onPressed: () => ref
                        .watch(getFriendStateNotifierProvider.notifier)
                        .fetchFrined(),
                    child: const Text('setUserAsync')),
                ElevatedButton(
                    onPressed: () => ref
                        .watch(userStateNotifierProvider.notifier)
                        .setUser(name: '!!!!!'),
                    child: const Text('setUser')),
                ElevatedButton(
                    onPressed: () async =>
                        ref.invalidate(getFriendStateNotifierProvider),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                    ),
                    child: const Text('refresh!')),
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
                ElevatedButton(
                    onPressed: () async => HomeNavigator.toTextArea(),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.purple),
                    ),
                    child: const Text('text_area')),
                ElevatedButton(
                    onPressed: () async =>
                        HomeNavigator.toTextAreaModal(context),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.purple),
                    ),
                    child: const Text('text_area_modal')),
                ElevatedButton(
                    onPressed: () async =>
                        HomeNavigator.toTextAreaBottomSheet(context),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.purple),
                    ),
                    child: const Text('text_area_bottom_sheet')),
                ElevatedButton(
                    onPressed: () async => HomeNavigator.toTabPage(),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.pink),
                    ),
                    child: Text('tab_page')),
                ElevatedButton(
                    onPressed: () async =>
                        HomeNavigator.toTabPageBottomSheet(context),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.purple),
                    ),
                    child: const Text('tab_page_bottom_sheet')),
                ElevatedButton(
                    onPressed: () async => HomeNavigator.toCarouselPage(),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.orange),
                    ),
                    child: const Text('carousel_page')),
                ElevatedButton(
                    onPressed: () async => HomeNavigator.toSelectorPage(),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                    ),
                    child: const Text('selector_page')),
              ],
            ),
          ),
        ),
      ),
    );
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