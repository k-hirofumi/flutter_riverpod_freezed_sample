import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_list_state_response.freezed.dart';
part 'post_list_state_response.g.dart';

@freezed
class PostListStateResponse with _$PostListStateResponse {
  factory PostListStateResponse({
    required int id,
    required int userId,
    required String post,
  }) = _PostListStateResponse;

  factory PostListStateResponse.fromJson(Map<String, dynamic> json) =>
      _$PostListStateResponseFromJson(json);
}
