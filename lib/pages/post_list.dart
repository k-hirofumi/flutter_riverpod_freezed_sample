import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flavor/components/alert_dialog.dart';
import 'package:test_flavor/components/custom_app_bar.dart';
import 'package:test_flavor/components/function_button_app_bar.dart';
import 'package:test_flavor/navigators/account_navigator.dart';
import 'package:test_flavor/navigators/chat_navigator.dart';
import 'package:test_flavor/providers/state/get_item_info_state_notifier.dart';
import 'package:test_flavor/providers/state/get_post_list_state_notifier.dart';
import 'package:test_flavor/utils/loading_handler.dart';

class PostListPage extends ConsumerWidget {
  const PostListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postListProvider = ref.watch(getPostListStateNotifierProvider);
    final postListProviderNortifier =
        ref.watch(getPostListStateNotifierProvider.notifier);
    Future<void> _refresh() async {
      await Future.delayed(
        const Duration(seconds: 1),
      );
      final overlay = LoadingHandler(context);
      await overlay.background(postListProviderNortifier.refetchPostList());
    }

    return Scaffold(
      appBar: FunctionButtonAppBar(
        title: 'post_list',
        hasExitButton: true,
      ),
      body: SafeArea(
        child: postListProvider.when(
          data: (postList) => Center(
            child: RefreshIndicator(
              onRefresh: _refresh,
              child: ListView.builder(
                itemCount: postList.length,
                itemBuilder: (context, index) {
                  return Text(postList[index].post);
                },
              ),
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
