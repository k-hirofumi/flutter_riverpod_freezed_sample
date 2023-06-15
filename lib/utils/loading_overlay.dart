import 'package:flutter/material.dart';
import 'package:test_flavor/components/alert_dialogue.dart';

class LoadingOverlay {
  LoadingOverlay(this.context);
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

  Future<void> during(Future<dynamic> future) async {
    show();

    future.then((message) {
      hide();

      //FIX_ME showDialogを柔軟に設定する必要があれば、during処理が完了した後にshowDialogを呼び出すようにする
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (ctx) => AlertDialog(
                title: const Text('success'),
                content: Text(message),
                actions: [
                  TextButton(
                      onPressed: () {
                        hide();
                      },
                      child: const Text('OK'))
                ],
              ));
    }).onError((error, stackTrace) {
      hide();
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (ctx) => NetworkErrorDialogue(errorCode: error),
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