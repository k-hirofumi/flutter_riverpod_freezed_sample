import 'package:flutter/material.dart';
import 'package:test_flavor/main.dart';
import 'package:test_flavor/pages/home.dart';
import 'package:test_flavor/pages/second.dart';
import 'package:test_flavor/pages/web_view.dart';
import 'package:test_flavor/pages/third.dart';

class ChatNavigator {
  //ChatNavigatorのルート
  static final chatRoutes = <String, WidgetBuilder>{
    "/": (context) => const Third(),
    "/second": (context) => Second(),
  };

  //MainNavigatorのルート
  static final mainRoutes = <String, WidgetBuilder>{
    "/webview": (context) => WebViewPage(),
  };

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static NavigatorState get _navigatorState => navigatorKey.currentState!;
  static NavigatorState _rootNavigator =
      Navigator.of(_navigatorState.context, rootNavigator: true);

  static void backToMain() {
    _navigatorState.popUntil(ModalRoute.withName('/'));
  }

  static void toMain() {
    _navigatorState.pushNamedAndRemoveUntil(
      '/',
      ModalRoute.withName('/'),
    );
  }

  static void toSecond() {
    _rootNavigator.pushNamed(
      '/second',
    );
  }

  static void toWebView() {
    _rootNavigator.pushNamed(
      '/webview',
    );
  }
}
