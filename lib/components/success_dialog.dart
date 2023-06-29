import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_flavor/components/custom_dialog.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({
    super.key,
    this.title = '更新完了',
    this.content = '更新が完了しました。',
  });
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      title: title,
      content: Text(content),
      onAction: () {},
    );
  }
}
