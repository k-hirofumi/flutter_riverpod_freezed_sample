import 'package:flutter/material.dart';
import 'package:test_flavor/utils/size_config.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.color,
  });
  final void Function() onPressed;
  final Widget child;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? Theme.of(context).primaryColor,
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.vw(8),
          vertical: SizeConfig.vh(4),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        textStyle: TextStyle(fontSize: SizeConfig.vmin(16)),
      ),
      child: child,
    );
  }
}
