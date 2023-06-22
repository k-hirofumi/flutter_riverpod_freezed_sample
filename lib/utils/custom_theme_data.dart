import 'package:flutter/material.dart';

class CustomThemeData {
  final ThemeData themeData;

  CustomThemeData()
      : themeData = ThemeData(
          primarySwatch: Colors.blue,

          //ここにサイズ関連の設定は書かない、それぞれのコンポーネントに書くこと
          //（レスポンシブ対応のサイズをここに書くと、キーボード表示時や画面向き変更時にMaterialAppからリビルドされてしまう）
        );
}
