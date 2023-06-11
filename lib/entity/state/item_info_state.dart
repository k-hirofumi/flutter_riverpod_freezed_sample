import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_info_state.freezed.dart';
part 'item_info_state.g.dart';

@freezed
class ItemInfoState with _$ItemInfoState {
  factory ItemInfoState({
    required int id,
    required String type,
    required String name,
    required String price,
  }) = _ItemInfoState;

  factory ItemInfoState.fromJson(Map<String, dynamic> json) =>
      _$ItemInfoStateFromJson(json);
}
