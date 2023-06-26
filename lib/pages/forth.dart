import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flavor/components/alert_dialog.dart';
import 'package:test_flavor/components/custom_dialog.dart';
import 'package:test_flavor/components/success_dialog.dart';
import 'package:test_flavor/navigators/home_navigator.dart';
import 'package:test_flavor/providers/state/get_item_info_state_notifier.dart';
import 'package:test_flavor/providers/repository/update_user_notifier.dart';
import 'package:test_flavor/providers/state/user_info_state_notifier.dart';
import 'package:test_flavor/utils/loading_handler.dart';
import 'package:test_flavor/utils/show_timer_dialog.dart';

class Forth extends ConsumerWidget {
  const Forth({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemProvider = ref.watch(getItemStateNotifierProvider);
    final overlay = LoadingHandler(context);
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Text('forth'),
              ElevatedButton(
                  onPressed: () async =>
                      ref.invalidate(userStateNotifierProvider),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                  ),
                  child: const Text('refresh!')),
              ElevatedButton(
                  onPressed: () async {
                    //更新完了後の処理
                    nextAction() async {
                      // await showDialog(
                      //     context: context,
                      //     barrierDismissible: true,
                      //     builder: (ctx) => SuccessDialog());
                      await showTimerDialog(
                          context, SuccessDialog()); //タイマー付きダイアログ
                      HomeNavigator.backToMain();
                    }

                    // ここで更新処理を実行
                    await showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (ctx) => CustomDialog(
                        title: '確認',
                        content: const Text('更新しますか？'),
                        actionLabel: 'はい',
                        onAction: () {
                          overlay.overlay(
                            ref
                                .watch(updateUserNotifierProvider.notifier)
                                .updateUser(),
                            nextAction: nextAction,
                          );
                        },
                        cancelLabel: 'いいえ',
                        onCancel: () {},
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                  ),
                  child: const Text('send!')),
            ],
          ),
        ),
      ),
    );
  }
}
