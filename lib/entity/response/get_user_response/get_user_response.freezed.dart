// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_user_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GetUserResponse _$GetUserResponseFromJson(Map<String, dynamic> json) {
  return _GetUserResponse.fromJson(json);
}

/// @nodoc
mixin _$GetUserResponse {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<UserItem> get userItems => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GetUserResponseCopyWith<GetUserResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetUserResponseCopyWith<$Res> {
  factory $GetUserResponseCopyWith(
          GetUserResponse value, $Res Function(GetUserResponse) then) =
      _$GetUserResponseCopyWithImpl<$Res, GetUserResponse>;
  @useResult
  $Res call({int id, String name, List<UserItem> userItems, String? email});
}

/// @nodoc
class _$GetUserResponseCopyWithImpl<$Res, $Val extends GetUserResponse>
    implements $GetUserResponseCopyWith<$Res> {
  _$GetUserResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? userItems = null,
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
      userItems: null == userItems
          ? _value.userItems
          : userItems // ignore: cast_nullable_to_non_nullable
              as List<UserItem>,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GetUserResponseCopyWith<$Res>
    implements $GetUserResponseCopyWith<$Res> {
  factory _$$_GetUserResponseCopyWith(
          _$_GetUserResponse value, $Res Function(_$_GetUserResponse) then) =
      __$$_GetUserResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, List<UserItem> userItems, String? email});
}

/// @nodoc
class __$$_GetUserResponseCopyWithImpl<$Res>
    extends _$GetUserResponseCopyWithImpl<$Res, _$_GetUserResponse>
    implements _$$_GetUserResponseCopyWith<$Res> {
  __$$_GetUserResponseCopyWithImpl(
      _$_GetUserResponse _value, $Res Function(_$_GetUserResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? userItems = null,
    Object? email = freezed,
  }) {
    return _then(_$_GetUserResponse(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      userItems: null == userItems
          ? _value._userItems
          : userItems // ignore: cast_nullable_to_non_nullable
              as List<UserItem>,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GetUserResponse implements _GetUserResponse {
  _$_GetUserResponse(
      {required this.id,
      required this.name,
      final List<UserItem> userItems = const [],
      this.email = ""})
      : _userItems = userItems;

  factory _$_GetUserResponse.fromJson(Map<String, dynamic> json) =>
      _$$_GetUserResponseFromJson(json);

  @override
  final int id;
  @override
  final String name;
  final List<UserItem> _userItems;
  @override
  @JsonKey()
  List<UserItem> get userItems {
    if (_userItems is EqualUnmodifiableListView) return _userItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userItems);
  }

  @override
  @JsonKey()
  final String? email;

  @override
  String toString() {
    return 'GetUserResponse(id: $id, name: $name, userItems: $userItems, email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetUserResponse &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._userItems, _userItems) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name,
      const DeepCollectionEquality().hash(_userItems), email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetUserResponseCopyWith<_$_GetUserResponse> get copyWith =>
      __$$_GetUserResponseCopyWithImpl<_$_GetUserResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GetUserResponseToJson(
      this,
    );
  }
}

abstract class _GetUserResponse implements GetUserResponse {
  factory _GetUserResponse(
      {required final int id,
      required final String name,
      final List<UserItem> userItems,
      final String? email}) = _$_GetUserResponse;

  factory _GetUserResponse.fromJson(Map<String, dynamic> json) =
      _$_GetUserResponse.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  List<UserItem> get userItems;
  @override
  String? get email;
  @override
  @JsonKey(ignore: true)
  _$$_GetUserResponseCopyWith<_$_GetUserResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

UserItem _$UserItemFromJson(Map<String, dynamic> json) {
  return _UserItem.fromJson(json);
}

/// @nodoc
mixin _$UserItem {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  String? get startAt => throw _privateConstructorUsedError;
  String? get endAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserItemCopyWith<UserItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserItemCopyWith<$Res> {
  factory $UserItemCopyWith(UserItem value, $Res Function(UserItem) then) =
      _$UserItemCopyWithImpl<$Res, UserItem>;
  @useResult
  $Res call(
      {int id, String name, String image, String? startAt, String? endAt});
}

/// @nodoc
class _$UserItemCopyWithImpl<$Res, $Val extends UserItem>
    implements $UserItemCopyWith<$Res> {
  _$UserItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? image = null,
    Object? startAt = freezed,
    Object? endAt = freezed,
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
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      startAt: freezed == startAt
          ? _value.startAt
          : startAt // ignore: cast_nullable_to_non_nullable
              as String?,
      endAt: freezed == endAt
          ? _value.endAt
          : endAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserItemCopyWith<$Res> implements $UserItemCopyWith<$Res> {
  factory _$$_UserItemCopyWith(
          _$_UserItem value, $Res Function(_$_UserItem) then) =
      __$$_UserItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id, String name, String image, String? startAt, String? endAt});
}

/// @nodoc
class __$$_UserItemCopyWithImpl<$Res>
    extends _$UserItemCopyWithImpl<$Res, _$_UserItem>
    implements _$$_UserItemCopyWith<$Res> {
  __$$_UserItemCopyWithImpl(
      _$_UserItem _value, $Res Function(_$_UserItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? image = null,
    Object? startAt = freezed,
    Object? endAt = freezed,
  }) {
    return _then(_$_UserItem(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      startAt: freezed == startAt
          ? _value.startAt
          : startAt // ignore: cast_nullable_to_non_nullable
              as String?,
      endAt: freezed == endAt
          ? _value.endAt
          : endAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserItem implements _UserItem {
  _$_UserItem(
      {required this.id,
      required this.name,
      required this.image,
      this.startAt,
      this.endAt});

  factory _$_UserItem.fromJson(Map<String, dynamic> json) =>
      _$$_UserItemFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String image;
  @override
  final String? startAt;
  @override
  final String? endAt;

  @override
  String toString() {
    return 'UserItem(id: $id, name: $name, image: $image, startAt: $startAt, endAt: $endAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserItem &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.startAt, startAt) || other.startAt == startAt) &&
            (identical(other.endAt, endAt) || other.endAt == endAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, image, startAt, endAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserItemCopyWith<_$_UserItem> get copyWith =>
      __$$_UserItemCopyWithImpl<_$_UserItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserItemToJson(
      this,
    );
  }
}

abstract class _UserItem implements UserItem {
  factory _UserItem(
      {required final int id,
      required final String name,
      required final String image,
      final String? startAt,
      final String? endAt}) = _$_UserItem;

  factory _UserItem.fromJson(Map<String, dynamic> json) = _$_UserItem.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get image;
  @override
  String? get startAt;
  @override
  String? get endAt;
  @override
  @JsonKey(ignore: true)
  _$$_UserItemCopyWith<_$_UserItem> get copyWith =>
      throw _privateConstructorUsedError;
}
