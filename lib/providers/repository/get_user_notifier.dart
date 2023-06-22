import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flavor/api/user_api.dart';
import 'package:test_flavor/entity/state/item_info_state_response.dart';
import 'package:test_flavor/entity/state/user_info_state.dart';
import 'package:test_flavor/providers/state/user_info_state_notifier.dart';
import 'package:test_flavor/utils/error_handler.dart';

class GetUserNotifier extends StateNotifier<void> {
  GetUserNotifier(this.ref) : super(null);
  final Ref ref;
  // //プロバイダー呼び出し時に初期データ取得(ステートをリセットする必要がある場合は使用しない)
  // : super(AsyncValue.loading()){
  // fetchDataAndUpdateUser()
  // };

  Future<void> fetchDataAndUpdateUser() async {
    try {
      await Future.delayed(const Duration(seconds: 1));

      //データ取得
      final data = await UserApi.getUserInfo();

      //ステートの更新
      ref
          .read(userStateNotifierProvider.notifier) //リビルドに巻き込まれないように必ずreadを使用する
          .setUser(id: data.id, name: data.name, email: data.email);
    } catch (error, stackTrace) {
      throw error;
    }
  }
}

final getUserNotifierProvider =
    StateNotifierProvider<GetUserNotifier, void>((ref) {
  return GetUserNotifier(ref);
});
