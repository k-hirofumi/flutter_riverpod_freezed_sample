import 'package:flutter/material.dart';
import 'package:test_flavor/main.dart';
import 'package:test_flavor/pages/fifth.dart';
import 'package:test_flavor/pages/home.dart';
import 'package:test_flavor/pages/second.dart';

class HomeNavigator {
  static final homeRoutes = <String, WidgetBuilder>{
    "/": (context) => const Home(),
    "/second": (context) => Second(),
    "/fifth": (context) => Fifth(),
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
    _navigatorState.pushNamed(
      '/second',
    );
  }

  static void toFifth() {
    _rootNavigator.pushNamed(
      '/fifth',
    );
  }
}
