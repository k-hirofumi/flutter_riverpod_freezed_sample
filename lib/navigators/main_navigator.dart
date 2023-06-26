import 'package:flutter/material.dart';
import 'package:test_flavor/main.dart';
import 'package:test_flavor/pages/carousel.dart';
import 'package:test_flavor/pages/tab_page.dart';
import 'package:test_flavor/pages/text_area.dart';
import 'package:test_flavor/pages/second.dart';
import 'package:test_flavor/pages/web_view.dart';

class MainNavigator {
  static final mainRoutes = <String, WidgetBuilder>{
    "/": (context) => const MainFrame(),
    "/second": (context) => Second(),
    "/webview": (context) => WebViewPage(),
    "/text_area": (context) => TextArea(),
    "/tab_page": (context) => TabPage(),
    "/carousel_page": (context) => CarouselPage(),
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
