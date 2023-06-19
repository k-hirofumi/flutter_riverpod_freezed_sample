import 'package:flutter/material.dart';
import 'package:test_flavor/main.dart';
import 'package:test_flavor/pages/second.dart';

class MainNavigator {
  static final mainRoutes = <String, WidgetBuilder>{
    "/": (context) => const MainFrame(),
    "/second": (context) => Second(),
    // "/login": (context) => const LoginForm(),
  };
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static NavigatorState get _navigatorState => navigatorKey.currentState!;

  static void backToMain() {
    _navigatorState.popUntil(ModalRoute.withName('/'));
  }

  static void toMain() {
    _navigatorState.pushNamedAndRemoveUntil(
      '/',
      ModalRoute.withName('/'),
    );
  }

  // static Future<void> toNewPostOrverlay(BuildContext context) {
  //   // return _navigatorState.pushNamed('/addNewPost');
  //   return _navigatorState.push(
  //     MaterialPageRoute(
  //       builder: (_) => const NewPost(),
  //       fullscreenDialog: true, // true だとモーダル遷移になる
  //     ),
  //   );
  // }
}
