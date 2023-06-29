import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flavor/api/user_api.dart';
import 'package:test_flavor/providers/state/user_info_state_notifier.dart';
import 'package:test_flavor/utils/error_handler.dart';

class UpdateUserNotifier extends StateNotifier<void> {
  UpdateUserNotifier(this.ref) : super(null);
  final Ref ref;
  // //プロバイダー呼び出し時に初期データ取得(ステートをリセットする必要がある場合は使用しない)
  // : super(AsyncValue.loading()){
  // fetchDataAndUpdateUser()
  // };

  Future<void> updateUser() async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      //データ取得
      // await UserApi.updateUser();
    } catch (error, stackTrace) {
      rethrow;
    }
  }
}

final updateUserNotifierProvider =
    StateNotifierProvider<UpdateUserNotifier, void>((ref) {
  return UpdateUserNotifier(ref);
});
