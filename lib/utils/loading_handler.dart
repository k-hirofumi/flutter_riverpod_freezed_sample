import 'package:flutter/material.dart';
import 'package:test_flavor/components/alert_dialog.dart';

class LoadingHandler {
  LoadingHandler(this.context);
  BuildContext context;

  void hide() {
    Navigator.of(context).pop();
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

    future.then((_) {
      hide();

      if (nextAction != null) {
        nextAction();
      }
      //FIX_ME showDialogを柔軟に設定する必要があれば、during処理が完了した後にshowDialogを呼び出すようにする
      // showDialog(
      //     context: context,
      //     barrierDismissible: false,
      //     builder: (ctx) => AlertDialog(
      //           title: const Text('success'),
      //           content: Text(successMessage),
      //           actions: [
      //             TextButton(
      //                 onPressed: () {
      //                   hide();
      //                 },
      //                 child: const Text('OK'))
      //           ],
      //         ));
    }).onError((error, stackTrace) {
      hide();
      showDialog(
        context: context,
        barrierDismissible: false,
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
        barrierDismissible: false,
        builder: (ctx) => NetworkErrorDialog(errorCode: error),
      );
    });
  }
}

class _FullScreenLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.5)),
        child: const Center(child: CircularProgressIndicator()));
  }
}
