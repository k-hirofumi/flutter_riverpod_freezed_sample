import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../entity/state/item_info_state_response.dart';

//実行時に
final getItemAsyncProvider =
    FutureProvider.autoDispose<ItemInfoStateResponse>((_) async {
  final data = await Future.delayed(const Duration(seconds: 2));
  await Dio()
      .get('https://api.example.com/data')
      .then((value) {})
      .onError((e, stackTrace) {
    if (e is DioException) {
      if (e.response != null) {
        // エラーステータスが存在する場合
        final statusCode = e.response!.statusCode;
        print('Error Status Code: $statusCode');
        // エラーレスポンスの内容も取得可能
        final errorData = e.response!.data;
        print('Error Response: $errorData');
        throw statusCode!;
      } else {
        // ネットワーク接続エラーやタイムアウトなどの場合
        print('Network Error: $e');
        throw 900;
      }
    } else {
      // DioError以外の例外の場合
      print('Unexpected Error: $e');
      throw 901;
    }
  });
  return data;
});
