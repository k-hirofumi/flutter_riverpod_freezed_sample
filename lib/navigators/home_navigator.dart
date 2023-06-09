import 'package:flutter/material.dart';
import 'package:test_flavor/main.dart';
import 'package:test_flavor/pages/carousel.dart';
import 'package:test_flavor/pages/post_list.dart';
import 'package:test_flavor/pages/tab_page.dart';
import 'package:test_flavor/pages/text_area.dart';
import 'package:test_flavor/pages/home.dart';
import 'package:test_flavor/pages/second.dart';

class HomeNavigator {
  //HomeNavigatorのルート
  static final homeRoutes = <String, WidgetBuilder>{
    "/": (context) => const Home(),
    "/second": (context) => Second(),
    "/textArea": (context) => TextArea(),
  };

  //MainNavigatorのルート
  static final mainRoutes = <String, WidgetBuilder>{
    "/second": (context) => Second(),
    "/text_area": (context) => TextArea(),
    "/tab_page": (context) => TabPage(),
    "/carousel_page": (context) => CarouselPage(),
    "/post_list_page": (context) => PostListPage(),
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

  static void toTextArea() {
    _rootNavigator.pushNamed(
      '/text_area',
    );
  }

  static void toTabPage() {
    _rootNavigator.pushNamed(
      '/tab_page',
    );
  }

  static void toCarouselPage() {
    _rootNavigator.pushNamed(
      '/carousel_page',
    );
  }

  static void toPostListPage() {
    _rootNavigator.pushNamed(
      '/post_list_page',
    );
  }

  static Future<void> toTextAreaModal(BuildContext context) {
    // return _navigatorState.pushNamed('/addNewPost');
    return _rootNavigator.push(
      MaterialPageRoute(
        builder: (_) => TextArea(),
        fullscreenDialog: true, // true だとモーダル遷移になる
      ),
    );
  }

  static Future<void> toTextAreaBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true, // 画面半分よりも大きなモーダルの表示設定
      useRootNavigator: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.85,
          child: TextArea(),
        );
      },
    );
  }

  static Future<void> toTabPageBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true, // 画面半分よりも大きなモーダルの表示設定
      useRootNavigator: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.85,
          child: TabPage(),
        );
      },
    );
  }
}
