import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flavor/utils/size_config.dart';
import 'package:test_flavor/utils/custom_theme_data.dart';
import 'package:test_flavor/components/lazy_load_index_stack.dart';
import 'package:test_flavor/navigators/account_navigator.dart';
import 'package:test_flavor/navigators/chat_navigator.dart';
import 'package:test_flavor/navigators/home_navigator.dart';
import 'package:test_flavor/navigators/main_navigator.dart';

import 'package:test_flavor/pages/home.dart';
import 'package:test_flavor/pages/introduction_screen.dart';
import 'package:test_flavor/pages/third.dart';
import 'package:test_flavor/providers/app_providers.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('Myapp');

    return Consumer(
      builder: (cnt, refx, child) => refx.watch(finishIntroductionProvider) ==
              false //イントロダクションを完了しているか？
          ? const IntroductionScreens()
          : MaterialApp(
              title: 'Flutter Demo',
              theme: CustomThemeData().themeData,
              navigatorKey: MainNavigator.navigatorKey,
              onGenerateRoute: (settings) {
                var builder = MainNavigator.mainRoutes[settings.name]!;

                return MaterialPageRoute(builder: builder, settings: settings);
              },
            ),
    );
  }
}

class MainFrame extends ConsumerStatefulWidget {
  const MainFrame({super.key});

  @override
  _MainFrameState createState() => _MainFrameState();
}

class _MainFrameState extends ConsumerState<MainFrame> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    Navigator(
      key: HomeNavigator.navigatorKey,
      onGenerateRoute: (settings) {
        var builder = HomeNavigator.homeRoutes[settings.name]!;
        return MaterialPageRoute(builder: builder, settings: settings);
      },
    ),
    Navigator(
      key: ChatNavigator.navigatorKey,
      onGenerateRoute: (settings) {
        var builder = ChatNavigator.chatRoutes[settings.name]!;
        return MaterialPageRoute(builder: builder, settings: settings);
      },
    ),
    Navigator(
      key: AccountNavigator.navigatorKey,
      onGenerateRoute: (settings) {
        var builder = AccountNavigator.accountRoutes[settings.name]!;
        return MaterialPageRoute(builder: builder, settings: settings);
      },
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('MainFrame');
    return Scaffold(
      body: LazyLoadIndexedStack(
        index: _currentIndex,
        children: _children,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Account',
          ),
        ],
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
