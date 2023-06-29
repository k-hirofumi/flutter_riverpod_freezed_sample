import 'package:freezed_annotation/freezed_annotation.dart';

part 'friend_info_state_response.freezed.dart';
part 'friend_info_state_response.g.dart';

@freezed
class FriendInfoStateResponse with _$FriendInfoStateResponse {
  factory FriendInfoStateResponse({
    required int id,
    required String name,
    @Default("") String? image,
  }) = _FriendInfoStateResponse;

  factory FriendInfoStateResponse.fromJson(Map<String, dynamic> json) =>
      _$FriendInfoStateResponseFromJson(json);
}
