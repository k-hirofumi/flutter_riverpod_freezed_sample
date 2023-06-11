import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_info_state.freezed.dart';

@freezed
class UserInfoState with _$UserInfoState {
  factory UserInfoState({
    required int id,
    required String name,
    @Default("") String? email,
  }) = _UserInfoState;

  // factory UserInfoEntity.fromJson(Map<String, dynamic> json) =>
  //     _$UserInfoEntityFromJson(json);
}
