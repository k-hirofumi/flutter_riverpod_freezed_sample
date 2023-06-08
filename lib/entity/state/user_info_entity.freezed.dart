// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_info_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserInfoEntity {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserInfoEntityCopyWith<UserInfoEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserInfoEntityCopyWith<$Res> {
  factory $UserInfoEntityCopyWith(
          UserInfoEntity value, $Res Function(UserInfoEntity) then) =
      _$UserInfoEntityCopyWithImpl<$Res, UserInfoEntity>;
  @useResult
  $Res call({int id, String name, String? email});
}

/// @nodoc
class _$UserInfoEntityCopyWithImpl<$Res, $Val extends UserInfoEntity>
    implements $UserInfoEntityCopyWith<$Res> {
  _$UserInfoEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserInfoEntityCopyWith<$Res>
    implements $UserInfoEntityCopyWith<$Res> {
  factory _$$_UserInfoEntityCopyWith(
          _$_UserInfoEntity value, $Res Function(_$_UserInfoEntity) then) =
      __$$_UserInfoEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String? email});
}

/// @nodoc
class __$$_UserInfoEntityCopyWithImpl<$Res>
    extends _$UserInfoEntityCopyWithImpl<$Res, _$_UserInfoEntity>
    implements _$$_UserInfoEntityCopyWith<$Res> {
  __$$_UserInfoEntityCopyWithImpl(
      _$_UserInfoEntity _value, $Res Function(_$_UserInfoEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = freezed,
  }) {
    return _then(_$_UserInfoEntity(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_UserInfoEntity implements _UserInfoEntity {
  _$_UserInfoEntity({required this.id, required this.name, this.email = ""});

  @override
  final int id;
  @override
  final String name;
  @override
  @JsonKey()
  final String? email;

  @override
  String toString() {
    return 'UserInfoEntity(id: $id, name: $name, email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserInfoEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserInfoEntityCopyWith<_$_UserInfoEntity> get copyWith =>
      __$$_UserInfoEntityCopyWithImpl<_$_UserInfoEntity>(this, _$identity);
}

abstract class _UserInfoEntity implements UserInfoEntity {
  factory _UserInfoEntity(
      {required final int id,
      required final String name,
      final String? email}) = _$_UserInfoEntity;

  @override
  int get id;
  @override
  String get name;
  @override
  String? get email;
  @override
  @JsonKey(ignore: true)
  _$$_UserInfoEntityCopyWith<_$_UserInfoEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
