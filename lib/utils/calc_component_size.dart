import 'package:flutter/cupertino.dart';

class CalcComponentSize {
  static double defaultDeviceWidth = 393.0;
  static double defaultDeviceHeight = 852.0;

  static double yourDeviceWidth = 393.0;
  static double yourDeviceHeight = 852.0;

  static setDeviceSize(BuildContext context) {
    yourDeviceWidth = MediaQuery.of(context).size.width;
    yourDeviceHeight = MediaQuery.of(context).size.height;
  }

  static double widthMagnification(double width) {
    if (yourDeviceWidth < defaultDeviceHeight) {
      return width;
    }
    return width * (yourDeviceWidth / defaultDeviceWidth);
  }

  static double heightMagnification(double height) {
    if (yourDeviceHeight < defaultDeviceHeight) {
      return height;
    }
    return height * (yourDeviceHeight / defaultDeviceHeight);
  }
}
