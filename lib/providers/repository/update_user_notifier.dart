import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flavor/entity/state/item_info_state_response.dart';
import 'package:test_flavor/entity/state/user_info_state.dart';
import 'package:test_flavor/providers/state/user_info_state_notifier.dart';

class UpdateUserNotifier extends StateNotifier<void> {
  UpdateUserNotifier(this.ref) : super(null);
  final Ref ref;
  // //プロバイダー呼び出し時に初期データ取得(ステートをリセットする必要がある場合は使用しない)
  // : super(AsyncValue.loading()){
  // fetchDataAndUpdateUser()
  // };

  Future<String> updateUser() async {
    try {
      // final data = await fetchData();

      await Future.delayed(const Duration(seconds: 2));
      await Dio()
          .get('https://api.example.com/data')
          .then((value) {})
          .onError((e, stackTrace) {
        if (e is DioException) {
          if (e.response != null) {
            // エラーステータスが存在する場合
            final statusCode = e.response!.statusCode;
            // エラーレスポンスの内容も取得可能
            final errorData = e.response!.data;
            throw statusCode!;
          } else {
            // ネットワーク接続エラーやタイムアウトなどの場合
            throw 900;
          }
        } else {
          // DioError以外の例外の場合
          throw 901;
        }
      });
      // throw 900;
      return '更新しました';
    } catch (error, stack) {
      throw error;
    }
  }
}

final updateUserNotifierProvider =
    StateNotifierProvider<UpdateUserNotifier, void>((ref) {
  return UpdateUserNotifier(ref);
});
