import 'package:flutter/material.dart';
import 'package:test_flavor/utils/calc_component_size.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  CustomAppBar({required this.title});

  @override
  Widget build(BuildContext context) {
    print('appbar');
    CalcComponentSize.setDeviceSize(context);
    return AppBar(
      title: Text(
        title,
        style: TextStyle(fontSize: CalcComponentSize.heightMagnification(20)),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(Icons.add),
          iconSize: CalcComponentSize.heightMagnification(25),
          onPressed: () {
            // ボタンが押された時の処理
          },
        ),
        IconButton(
          icon: Icon(Icons.remove),
          iconSize: CalcComponentSize.heightMagnification(25),
          onPressed: () {
            // ボタンが押された時の処理
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
      kToolbarHeight - 40 + CalcComponentSize.heightMagnification(25));
}
