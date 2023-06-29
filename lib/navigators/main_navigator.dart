import 'package:flutter/material.dart';
import 'package:test_flavor/main.dart';
import 'package:test_flavor/navigators/account_navigator.dart';
import 'package:test_flavor/navigators/chat_navigator.dart';
import 'package:test_flavor/navigators/home_navigator.dart';
import 'package:test_flavor/pages/carousel.dart';
import 'package:test_flavor/pages/post_list.dart';
import 'package:test_flavor/pages/tab_page.dart';
import 'package:test_flavor/pages/text_area.dart';
import 'package:test_flavor/pages/second.dart';
import 'package:test_flavor/pages/web_view.dart';

class MainNavigator {
  static final mainRoutes = <String, WidgetBuilder>{
    ...HomeNavigator.mainRoutes,
    ...ChatNavigator.mainRoutes,
    ...AccountNavigator.mainRoutes,

    //MainNavigatorのルート
    "/": (context) => const MainFrame(),
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
