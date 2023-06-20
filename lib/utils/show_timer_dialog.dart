import 'dart:async';

import 'package:flutter/material.dart';

Future<void> showTimerDialog(BuildContext context, Widget dialog) async {
  const displayTime = Duration(seconds: 3);

  try {
    await showDialog(context: context, builder: (_) => dialog)
        .timeout(displayTime);
  } on TimeoutException {
    // import 'dart:async'; することで、利用可能になります。
    Navigator.of(context, rootNavigator: true).pop();
  }
}
