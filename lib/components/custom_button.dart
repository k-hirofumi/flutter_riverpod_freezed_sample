import 'package:flutter/material.dart';
import 'package:test_flavor/utils/calc_component_size.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPress,
    required this.child,
    this.color,
  });
  final void Function() onPress;
  final Widget child;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    CalcComponentSize.setDeviceSize(context);

    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        textStyle:
            TextStyle(fontSize: CalcComponentSize.heightMagnification(18)),
      ),
      child: child,
    );
  }
}
