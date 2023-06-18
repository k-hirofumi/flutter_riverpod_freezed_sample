import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_flavor/components/alert_dialog.dart';
import 'package:test_flavor/components/default_app_bar.dart';
import 'package:test_flavor/providers/repository/get_item_info_notifier.dart';

class Third extends ConsumerWidget {
  const Third({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemProvider = ref.watch(getUserNotifierProvider);
    return Scaffold(
      appBar: DefaultAppBar(
        title: 'Third',
      ),
      body: SafeArea(
        child: itemProvider.when(
          data: (data) => Center(
            child: Column(
              children: [
                const Text('third'),
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
