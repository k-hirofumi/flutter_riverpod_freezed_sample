// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'friend_info_state_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FriendInfoStateResponse _$FriendInfoStateResponseFromJson(
    Map<String, dynamic> json) {
  return _FriendInfoStateResponse.fromJson(json);
}

/// @nodoc
mixin _$FriendInfoStateResponse {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FriendInfoStateResponseCopyWith<FriendInfoStateResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FriendInfoStateResponseCopyWith<$Res> {
  factory $FriendInfoStateResponseCopyWith(FriendInfoStateResponse value,
          $Res Function(FriendInfoStateResponse) then) =
      _$FriendInfoStateResponseCopyWithImpl<$Res, FriendInfoStateResponse>;
  @useResult
  $Res call({int id, String name, String? image});
}

/// @nodoc
class _$FriendInfoStateResponseCopyWithImpl<$Res,
        $Val extends FriendInfoStateResponse>
    implements $FriendInfoStateResponseCopyWith<$Res> {
  _$FriendInfoStateResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? image = freezed,
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
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FriendInfoStateResponseCopyWith<$Res>
    implements $FriendInfoStateResponseCopyWith<$Res> {
  factory _$$_FriendInfoStateResponseCopyWith(_$_FriendInfoStateResponse value,
          $Res Function(_$_FriendInfoStateResponse) then) =
      __$$_FriendInfoStateResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String? image});
}

/// @nodoc
class __$$_FriendInfoStateResponseCopyWithImpl<$Res>
    extends _$FriendInfoStateResponseCopyWithImpl<$Res,
        _$_FriendInfoStateResponse>
    implements _$$_FriendInfoStateResponseCopyWith<$Res> {
  __$$_FriendInfoStateResponseCopyWithImpl(_$_FriendInfoStateResponse _value,
      $Res Function(_$_FriendInfoStateResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? image = freezed,
  }) {
    return _then(_$_FriendInfoStateResponse(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FriendInfoStateResponse implements _FriendInfoStateResponse {
  _$_FriendInfoStateResponse(
      {required this.id, required this.name, this.image = ""});

  factory _$_FriendInfoStateResponse.fromJson(Map<String, dynamic> json) =>
      _$$_FriendInfoStateResponseFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  @JsonKey()
  final String? image;

  @override
  String toString() {
    return 'FriendInfoStateResponse(id: $id, name: $name, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FriendInfoStateResponse &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FriendInfoStateResponseCopyWith<_$_FriendInfoStateResponse>
      get copyWith =>
          __$$_FriendInfoStateResponseCopyWithImpl<_$_FriendInfoStateResponse>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FriendInfoStateResponseToJson(
      this,
    );
  }
}

abstract class _FriendInfoStateResponse implements FriendInfoStateResponse {
  factory _FriendInfoStateResponse(
      {required final int id,
      required final String name,
      final String? image}) = _$_FriendInfoStateResponse;

  factory _FriendInfoStateResponse.fromJson(Map<String, dynamic> json) =
      _$_FriendInfoStateResponse.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String? get image;
  @override
  @JsonKey(ignore: true)
  _$$_FriendInfoStateResponseCopyWith<_$_FriendInfoStateResponse>
      get copyWith => throw _privateConstructorUsedError;
}
