import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class NetworkErrorDialog extends StatelessWidget {
  const NetworkErrorDialog({super.key, this.errorCode});
  final errorCode;

  @override
  Widget build(BuildContext context) {
    late Widget dialogue;

    switch (errorCode) {
      case 900:
        return CupertinoAlertDialog(
          title: Text('Error'),
          content: Text('通信に失敗しました。時間をおいて再度お試しください。'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      case 901:
        return CupertinoAlertDialog(
          title: Text('Error'),
          content: Text('通信に失敗しました。'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      default:
        return CupertinoAlertDialog(
          title: Text('Error'),
          content: Text('通信に失敗しました。'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
    }
  }
}
