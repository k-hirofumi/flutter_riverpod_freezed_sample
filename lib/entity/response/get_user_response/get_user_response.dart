import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_user_response.freezed.dart';
part 'get_user_response.g.dart';

@freezed
class GetUserResponse with _$GetUserResponse {
  factory GetUserResponse({
    required int id,
    required String name,
    @Default([]) List<UserItem> userItems,
    @Default("") String? email,
  }) = _GetUserResponse;

  factory GetUserResponse.fromJson(Map<String, dynamic> json) =>
      _$GetUserResponseFromJson(json);
}

@freezed
class UserItem with _$UserItem {
  factory UserItem({
    required int id,
    required String name,
    required String image,
    String? startAt,
    String? endAt,
  }) = _UserItem;

  factory UserItem.fromJson(Map<String, dynamic> json) =>
      _$UserItemFromJson(json);
}
