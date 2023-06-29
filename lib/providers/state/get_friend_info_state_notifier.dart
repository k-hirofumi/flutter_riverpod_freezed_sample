import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flavor/api/user_api.dart';
import 'package:test_flavor/entity/state/friend_info_state_response/friend_info_state_response.dart';
import 'package:test_flavor/providers/state/user_info_state_notifier.dart';
import 'package:test_flavor/utils/error_handler.dart';

class GetFriendInfoStateNotifier
    extends StateNotifier<AsyncValue<FriendInfoStateResponse>> {
  GetFriendInfoStateNotifier(this.ref) : super(const AsyncValue.loading()) {
    fetchFrined();
  }
  final Ref ref;

  Future<void> fetchFrined() async {
    state = const AsyncValue.loading();
    try {
      await Future.delayed(const Duration(seconds: 1));

      //データ取得
      // final data = await UserApi.getUserInfo();

      // //ステートの更新
      // ref
      //     .read(userStateNotifierProvider.notifier) //リビルドに巻き込まれないように必ずreadを使用する
      //     .setUser(id: data.id, name: data.name, email: data.email);
      final data = FriendInfoStateResponse(id: 123, name: 'test');
      state = AsyncValue.data(data);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}

final getFriendStateNotifierProvider = StateNotifierProvider.autoDispose<
    GetFriendInfoStateNotifier, AsyncValue<void>>((ref) {
  return GetFriendInfoStateNotifier(ref);
});
