import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_info_state_response.freezed.dart';
part 'item_info_state_response.g.dart';

@freezed
class ItemInfoStateResponse with _$ItemInfoStateResponse {
  factory ItemInfoStateResponse({
    required int id,
    required String type,
    required String name,
    required String price,
  }) = _ItemInfoStateResponse;

  factory ItemInfoStateResponse.fromJson(Map<String, dynamic> json) =>
      _$ItemInfoStateResponseFromJson(json);
}
