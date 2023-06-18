import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  DefaultAppBar({required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // automaticallyImplyLeading: false,
      title: Text(
        title,
        style: TextStyle(fontSize: 20.h),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(Icons.add),
          iconSize: 25.h,
          onPressed: () {
            // ボタンが押された時の処理
          },
        ),
        IconButton(
          icon: Icon(Icons.remove),
          iconSize: 25.h,
          onPressed: () {
            // ボタンが押された時の処理
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight.h - 5.h);
}
