import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({
    super.key,
    required this.title,
    required this.content,
    this.actionLabel = 'OK',
    this.cancelLabel = 'キャンセル',
    this.onAction,
    this.onCancel,
  });

  final String title;
  final Widget content;
  final String? actionLabel;
  final String? cancelLabel;
  final VoidCallback? onAction;
  final VoidCallback? onCancel;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(title),
      content: content,
      actions: onCancel != null
          ? <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  if (onCancel != null) onCancel!();
                },
                child: Text(cancelLabel!),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  print(onAction);
                  if (onAction != null) onAction!();
                },
                child: Text(actionLabel!),
              ),
            ]
          : <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  if (onAction != null) onAction!();
                },
                child: Text(actionLabel!),
              ),
            ],
    );
  }
}
