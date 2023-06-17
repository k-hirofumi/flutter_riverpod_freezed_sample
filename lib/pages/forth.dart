import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flavor/components/alert_dialog.dart';
import 'package:test_flavor/providers/repository/get_item_info_notifier.dart';
import 'package:test_flavor/providers/repository/update_user_notifier.dart';
import 'package:test_flavor/providers/state/user_info_state_notifier.dart';
import 'package:test_flavor/utils/loading_handler.dart';

class Forth extends ConsumerWidget {
  const Forth({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemProvider = ref.watch(getUserNotifierProvider);
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
                    nextAction() {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (ctx) => AlertDialog(
                          title: const Text('更新完了'),
                          content: const Text('更新が完了しました。'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(ctx).pop();
                                Navigator.of(ctx).pop();
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    }

                    // ここで更新処理を実行
                    await overlay.overlay(
                      ref
                          .watch(updateUserNotifierProvider.notifier)
                          .updateUser(),
                      nextAction: nextAction,
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
