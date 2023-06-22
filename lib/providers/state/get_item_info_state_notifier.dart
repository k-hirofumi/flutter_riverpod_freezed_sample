import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flavor/entity/state/item_info_state_response.dart';
import 'package:test_flavor/entity/state/user_info_state.dart';
import 'package:test_flavor/providers/state/user_info_state_notifier.dart';
import 'package:test_flavor/utils/error_handler.dart';

class GetItemInfoStateNotifier
    extends StateNotifier<AsyncValue<ItemInfoStateResponse>> {
  GetItemInfoStateNotifier(this.ref) : super(const AsyncValue.loading()) {
    fetchItem();
  }
  final Ref ref;
  // //プロバイダー呼び出し時に初期データ取得(ステートをリセットする必要がある場合は使用しない)
  // : super(AsyncValue.loading()){
  // fetchDataAndUpdateUser()
  // };

  Future<void> fetchItem() async {
    state = const AsyncValue.loading();
    try {
      await Future.delayed(const Duration(seconds: 1));
      // await Dio()
      //     .get('https://api.example.com/data')
      //     .then((value) {})
      //     .onError((error, stackTrace) {
      //   ErrorHandler.handle(error); //エラーハンドリング
      // });

      final data = ItemInfoStateResponse(
        id: 1,
        name: 'name',
        price: '100',
        type: 'aaa',
      );
      state = AsyncValue.data(data);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}

final getItemStateNotifierProvider = StateNotifierProvider.autoDispose<
    GetItemInfoStateNotifier, AsyncValue<ItemInfoStateResponse>>((ref) {
  return GetItemInfoStateNotifier(ref);
});
