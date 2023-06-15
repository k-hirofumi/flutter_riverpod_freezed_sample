import 'package:flutter/material.dart';
import 'package:test_flavor/components/alert_dialog.dart';

class LoadingBackground {
  LoadingBackground(this.context);
  BuildContext context;

  Future<void> during(Future<dynamic> future) async {
    future.then((value) {
      //処理成功時のメッセージは表示しない。
    }).onError((error, stackTrace) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (ctx) => NetworkErrorDialog(errorCode: error),
      );
    });
  }
}
