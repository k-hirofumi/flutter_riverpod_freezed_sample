import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flavor/components/alert_dialog.dart';
import 'package:test_flavor/components/custom_app_bar.dart';
import 'package:test_flavor/navigators/account_navigator.dart';
import 'package:test_flavor/navigators/chat_navigator.dart';
import 'package:test_flavor/providers/state/get_item_info_state_notifier.dart';

class Third extends ConsumerWidget {
  const Third({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemProvider = ref.watch(getItemStateNotifierProvider);
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Third',
        hasExitButton: true,
      ),
      body: SafeArea(
        child: itemProvider.when(
          data: (data) => Center(
            child: Column(
              children: [
                const Text('third'),
                ElevatedButton(
                  onPressed: () => ChatNavigator.toSecond(),
                  child: Text('toSecond'),
                ),
                ElevatedButton(
                  onPressed: () => ChatNavigator.toWebView(),
                  child: Text('toWebview'),
                ),
              ],
            ),
          ),
          loading: () => Center(
            child: Container(
              child: CircularProgressIndicator(),
            ),
          ),
          error: (error, stackTrace) {
            WidgetsBinding.instance.addPostFrameCallback(
              (_) {
                showDialog(
                    context: context,
                    builder: (_) => NetworkErrorDialog(errorCode: error));
              },
            );
            return Center(
              child: Container(
                child: Text('データの取得に失敗しました。'),
              ),
            );
          },
        ),
      ),
    );
  }
}
