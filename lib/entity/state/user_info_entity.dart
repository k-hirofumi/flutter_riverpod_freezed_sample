import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_info_entity.freezed.dart';

@freezed
class UserInfoEntity with _$UserInfoEntity {
  factory UserInfoEntity({
    required int id,
    required String name,
    @Default("") String? email,
  }) = _UserInfoEntity;

  // factory UserInfoEntity.fromJson(Map<String, dynamic> json) =>
  //     _$UserInfoEntityFromJson(json);
}
