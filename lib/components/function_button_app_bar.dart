import 'package:flutter/material.dart';
import 'package:test_flavor/components/custom_app_bar.dart';
import 'package:test_flavor/utils/size_config.dart';

class FunctionButtonAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final bool hasExitButton;
  final List<Widget>? functionButtons;
  final PreferredSizeWidget? bottom;

  FunctionButtonAppBar({
    required this.title,
    this.hasExitButton = false,
    this.functionButtons,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: title,
      hasExitButton: hasExitButton,
      functionButtons: [
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
