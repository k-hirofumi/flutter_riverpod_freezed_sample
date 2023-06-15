import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flavor/utils/error_handler.dart';

import '../../entity/state/item_info_state_response.dart';

//Itemステート（autoDisposeを使うことでproviderをwatchするたびにProviderを初期化）
final getItemAsyncProvider =
    FutureProvider.autoDispose<ItemInfoStateResponse>((_) async {
  try {
    await Future.delayed(const Duration(seconds: 2));
    final data = await Dio()
        .get('https://api.example.com/data')
        .then((value) {})
        .onError(
      (error, stackTrace) {
        ErrorHandler.handle(error); //エラーハンドリング
      },
    );
    return data as ItemInfoStateResponse;
  } catch (error, stackTrace) {
    throw error;
  }
});
