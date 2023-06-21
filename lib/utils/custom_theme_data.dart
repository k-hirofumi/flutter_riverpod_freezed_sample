import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomThemeData {
  final ThemeData themeData;

  CustomThemeData()
      : themeData = ThemeData(
          primarySwatch: Colors.blue,

          //↓これを使用すると、キーボード表示時、画面の向き変更時にリビルドが数10回走ってしまう

          // textTheme: TextTheme(
          //   bodyLarge: TextStyle(fontSize: ScreenUtil().setSp(24)),
          //   bodyMedium: TextStyle(fontSize: ScreenUtil().setSp(18)),
          //   bodySmall: TextStyle(fontSize: ScreenUtil().setSp(14)),
          // ),

          // elevatedButtonTheme: ElevatedButtonThemeData(
          //   style: ElevatedButton.styleFrom(
          //     backgroundColor: Colors.red,
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(10),
          //     ),
          //     textStyle: TextStyle(
          //       fontSize: ScreenUtil().setSp(18.w < 18 ? 18 : 18.w),
          //     ),
          //   ),
          // ),
        );
}
