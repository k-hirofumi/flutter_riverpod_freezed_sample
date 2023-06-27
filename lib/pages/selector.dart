import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flavor/components/alert_dialog.dart';
import 'package:test_flavor/components/custom_app_bar.dart';
import 'package:test_flavor/navigators/account_navigator.dart';
import 'package:test_flavor/navigators/chat_navigator.dart';
import 'package:test_flavor/providers/state/get_item_info_state_notifier.dart';
import 'package:test_flavor/providers/state/get_post_list_state_notifier.dart';

class SelectorPage extends ConsumerWidget {
  const SelectorPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postListProvider = ref.watch(getPostListStateNotifierProvider);
    return Scaffold(
      appBar: CustomAppBar(
        title: 'selector',
        hasExitButton: true,
      ),
      body: SafeArea(
        child: postListProvider.when(
          data: (postList) => Center(
            child: Column(
              children: [
                const Text('selector'),
                for (var post in postList) Text(post.post),
                ElevatedButton(
                    onPressed: () => ref
                        .read(getPostListStateNotifierProvider.notifier)
                        .fetchPostList(),
                    child: Text('add!'))
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
