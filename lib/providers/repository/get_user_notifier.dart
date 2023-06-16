import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flavor/api/user_api.dart';
import 'package:test_flavor/entity/state/item_info_state_response.dart';
import 'package:test_flavor/entity/state/user_info_state.dart';
import 'package:test_flavor/providers/state/user_info_state_notifier.dart';
import 'package:test_flavor/utils/error_handler.dart';

class GetUserNotifier extends StateNotifier<AsyncValue<void>> {
  GetUserNotifier(this.ref) : super(const AsyncValue.loading()) {
    fetchDataAndUpdateUser();
  }
  final Ref ref;
  // //プロバイダー呼び出し時に初期データ取得(ステートをリセットする必要がある場合は使用しない)
  // : super(AsyncValue.loading()){
  // fetchDataAndUpdateUser()
  // };

  Future<void> fetchDataAndUpdateUser() async {
    state = const AsyncValue.loading();
    try {
      await Future.delayed(const Duration(seconds: 1));

      //データ取得
      final data = await UserApi.getUserInfo();

      //ステートの更新
      ref
          .read(userStateNotifierProvider.notifier) //リビルドに巻き込まれないように必ずreadを使用する
          .setUser(id: data.id, name: data.name, email: data.email);
      state = const AsyncValue.data(null);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}

final getUserNotifierProvider =
    StateNotifierProvider.autoDispose<GetUserNotifier, AsyncValue<void>>((ref) {
  return GetUserNotifier(ref);
});
