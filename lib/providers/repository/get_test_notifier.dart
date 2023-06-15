import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flavor/entity/state/item_info_state.dart';
import 'package:test_flavor/entity/state/user_info_state.dart';
import 'package:test_flavor/providers/state/test_state_notifier.dart';
import 'package:test_flavor/providers/state/user_info_state_notifier.dart';

class GetTestNotifier extends StateNotifier<AsyncValue<void>> {
  GetTestNotifier(this.ref) : super(AsyncValue.loading()) {
    fetchTestUser();
  }
  final Ref ref;

  Future<void> fetchTestUser() async {
    state = const AsyncValue.loading();

    try {
      await Future.delayed(const Duration(seconds: 1));
      // await Dio()
      //     .get('https://api.example.com/data')
      //     .then((value) {})
      //     .onError((e, stackTrace) {
      //   if (e is DioException) {
      //     if (e.response != null) {
      //       // エラーステータスが存在する場合
      //       final statusCode = e.response!.statusCode;
      //       print('Error Status Code: $statusCode');
      //       // エラーレスポンスの内容も取得可能
      //       final errorData = e.response!.data;
      //       print('Error Response: $errorData');
      //       throw statusCode!;
      //     } else {
      //       // ネットワーク接続エラーやタイムアウトなどの場合
      //       print('Network Error: $e');
      //       throw 900;
      //     }
      //   } else {
      //     // DioError以外の例外の場合
      //     print('Unexpected Error: $e');
      //     throw 901;
      //   }
      // });

      ref
          .read(testStateNotifierProvider.notifier)
          .setUser(id: 999, name: 'geted_name', email: 'mail_name');
      state = const AsyncValue.data(null);
    } catch (error, stack) {
      state = AsyncValue.error(error, stack);
    }
  }
}

final getTestNotifierProvider =
    StateNotifierProvider<GetTestNotifier, AsyncValue<void>>((ref) {
  return GetTestNotifier(ref);
});
