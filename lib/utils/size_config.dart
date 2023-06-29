import 'package:flutter/cupertino.dart';

class SizeConfig {
  static double defaultDeviceWidth = 393.0; //iPhone12Pro
  static double defaultDeviceHeight = 852.0; //iPhone12Pro

  static double yourDeviceWidth = 393.0;
  static double yourDeviceHeight = 852.0;

  static init(BuildContext context) {
    yourDeviceWidth = MediaQuery.of(context).size.width;
    yourDeviceHeight = MediaQuery.of(context).size.height;
  }

  //画面横サイズを考慮した高さ(minLimitがtrueであればデフォルト画面サイズ指定したサイズより小さくならない)
  static double vw(
    double width, //調整対象のサイズ
    {
    bool minLimit = true, //最小サイズを制限するか
    bool maxLimit = false, //最大サイズを制限するか
    double maxSize = 500, //最大サイズ
  }) {
    if (minLimit == true && yourDeviceWidth < defaultDeviceHeight) {
      return width;
    }
    if (maxLimit == true && yourDeviceWidth > maxSize) {
      return width * (maxSize / defaultDeviceWidth);
    }
    return width * (yourDeviceWidth / defaultDeviceWidth);
  }

  //画面縦サイズを考慮した高さ(minLimitがtrueであればデフォルト画面サイズ指定したサイズより小さくならない)
  static double vh(
    double height, //調整対象のサイズ
    {
    bool minLimit = true, //最小サイズを制限するか
    bool maxLimit = false, //最大サイズを制限するか
    double maxSize = 800, //最大サイズ
  }) {
    if (minLimit == true && yourDeviceHeight < defaultDeviceHeight) {
      return height;
    }
    if (maxLimit == true && yourDeviceHeight > maxSize) {
      return height * (maxSize / defaultDeviceHeight);
    }
    return height * (yourDeviceHeight / defaultDeviceHeight);
  }

  //画面の短い方のサイズに合わせた長さ
  static double vmin(double size) {
    if (yourDeviceWidth < yourDeviceHeight) {
      if (yourDeviceWidth > defaultDeviceHeight) {
        return size * (yourDeviceWidth / defaultDeviceHeight);
      } else {
        return size;
      }
    } else {
      if (yourDeviceHeight > defaultDeviceHeight) {
        return size * (yourDeviceHeight / defaultDeviceHeight);
      } else {
        return size;
      }
    }
  }

  //画面の長い方のサイズに合わせた長さ
  static double vmax(double size) {
    if (yourDeviceWidth > yourDeviceHeight) {
      if (yourDeviceWidth > defaultDeviceHeight) {
        return size * (yourDeviceWidth / defaultDeviceHeight);
      } else {
        return size;
      }
    } else {
      if (yourDeviceHeight > defaultDeviceHeight) {
        return size * (yourDeviceHeight / defaultDeviceHeight);
      } else {
        return size;
      }
    }
  }
}
