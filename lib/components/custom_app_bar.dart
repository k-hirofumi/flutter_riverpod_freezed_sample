import 'package:flutter/material.dart';
import 'package:test_flavor/utils/size_config.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final PreferredSizeWidget? bottom;
  final bool hasExitButton;

  CustomAppBar({required this.title, this.bottom, this.hasExitButton = false});

  @override
  Widget build(BuildContext context) {
    print('appbar');
    SizeConfig.init(context);
    return AppBar(
      backgroundColor: Colors.white.withOpacity(0.0),
      elevation: 0.0,
      leading: hasExitButton
          ? IconButton(
              icon:
                  Icon(Icons.arrow_back, color: Colors.red), // ここでアイコンの色を変更します
              onPressed: () => Navigator.of(context).pop(),
            )
          : null,
      title: Text(
        title,
        style: TextStyle(fontSize: SizeConfig.vh(20), color: Colors.black),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(Icons.add),
          iconSize: SizeConfig.vh(25),
          color: Colors.black,
          onPressed: () {
            // ボタンが押された時の処理
          },
        ),
        IconButton(
          icon: Icon(Icons.remove),
          iconSize: SizeConfig.vh(25),
          color: Colors.black,
          onPressed: () {
            // ボタンが押された時の処理
          },
        ),
      ],
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight -
      40 +
      SizeConfig.vh(25) +
      (bottom?.preferredSize.height ?? 0));
}
