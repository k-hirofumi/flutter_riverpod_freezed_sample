import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:test_flavor/components/custom_dialog.dart';

class NetworkErrorDialog extends StatelessWidget {
  const NetworkErrorDialog({super.key, this.errorCode});
  final errorCode;

  @override
  Widget build(BuildContext context) {
    late Widget dialogue;

    switch (errorCode) {
      case 900:
        return CustomDialog(
          title: 'Error',
          content: Text('通信に失敗しました。時間をおいて再度お試しください。'),
        );
      case 901:
        return CustomDialog(
          title: 'Error',
          content: Text('通信に失敗しました。'),
        );
      default:
        return CustomDialog(
          title: 'Error',
          content: Text('通信に失敗しました。'),
        );
    }
  }
}
