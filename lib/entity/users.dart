import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_flavor/entity/user_entity.dart';

part 'users.freezed.dart';
part 'users.g.dart';

@freezed
class Users with _$Users {
  factory Users({
    required List<UserEntity> users,
  }) = _Users;

  factory Users.fromJson(Map<String, dynamic> json) => _$UsersFromJson(json);
}
