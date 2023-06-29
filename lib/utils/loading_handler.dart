import 'package:flutter/material.dart';
import 'package:test_flavor/components/alert_dialog.dart';

class LoadingHandler {
  LoadingHandler(this.context);
  BuildContext context;

  Future<void> hide() async {
    return Navigator.of(context, rootNavigator: true).pop();
  }

  void show() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (ctx) => _FullScreenLoader());
  }

  Future<void> overlay(Future<dynamic> future,
      {Function? nextAction, String successMessage = '処理が完了しました。'}) async {
    show();

    future.then((_) async {
      await hide();

      if (nextAction != null) {
        nextAction();
      }
    }).onError((error, stackTrace) async {
      await hide();
      showDialog(
        context: context,
        barrierDismissible: true,
        builder: (ctx) => NetworkErrorDialog(errorCode: error),
      );
    });
  }

  Future<void> background(Future<dynamic> future) async {
    future.then((value) {
      //処理成功時のメッセージは表示しない。
    }).onError((error, stackTrace) {
      showDialog(
        context: context,
        barrierDismissible: true,
        builder: (ctx) => NetworkErrorDialog(errorCode: error),
      );
    });
  }
}

class _FullScreenLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.1)),
        child: const Center(child: CircularProgressIndicator()));
  }
}
