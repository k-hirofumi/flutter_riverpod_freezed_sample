import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../entity/state/item_info_state.dart';

//実行時に
final getItemAsyncProvider =
    FutureProvider.autoDispose<ItemInfoState>((_) async {
  final data = await Future.delayed(const Duration(seconds: 2));
  return data;
});
