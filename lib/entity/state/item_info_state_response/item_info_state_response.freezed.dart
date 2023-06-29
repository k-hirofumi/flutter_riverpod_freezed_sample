// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_info_state_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ItemInfoStateResponse _$ItemInfoStateResponseFromJson(
    Map<String, dynamic> json) {
  return _ItemInfoStateResponse.fromJson(json);
}

/// @nodoc
mixin _$ItemInfoStateResponse {
  int get id => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemInfoStateResponseCopyWith<ItemInfoStateResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemInfoStateResponseCopyWith<$Res> {
  factory $ItemInfoStateResponseCopyWith(ItemInfoStateResponse value,
          $Res Function(ItemInfoStateResponse) then) =
      _$ItemInfoStateResponseCopyWithImpl<$Res, ItemInfoStateResponse>;
  @useResult
  $Res call({int id, String type, String name, String price});
}

/// @nodoc
class _$ItemInfoStateResponseCopyWithImpl<$Res,
        $Val extends ItemInfoStateResponse>
    implements $ItemInfoStateResponseCopyWith<$Res> {
  _$ItemInfoStateResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? name = null,
    Object? price = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ItemInfoStateResponseCopyWith<$Res>
    implements $ItemInfoStateResponseCopyWith<$Res> {
  factory _$$_ItemInfoStateResponseCopyWith(_$_ItemInfoStateResponse value,
          $Res Function(_$_ItemInfoStateResponse) then) =
      __$$_ItemInfoStateResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String type, String name, String price});
}

/// @nodoc
class __$$_ItemInfoStateResponseCopyWithImpl<$Res>
    extends _$ItemInfoStateResponseCopyWithImpl<$Res, _$_ItemInfoStateResponse>
    implements _$$_ItemInfoStateResponseCopyWith<$Res> {
  __$$_ItemInfoStateResponseCopyWithImpl(_$_ItemInfoStateResponse _value,
      $Res Function(_$_ItemInfoStateResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? name = null,
    Object? price = null,
  }) {
    return _then(_$_ItemInfoStateResponse(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ItemInfoStateResponse implements _ItemInfoStateResponse {
  _$_ItemInfoStateResponse(
      {required this.id,
      required this.type,
      required this.name,
      required this.price});

  factory _$_ItemInfoStateResponse.fromJson(Map<String, dynamic> json) =>
      _$$_ItemInfoStateResponseFromJson(json);

  @override
  final int id;
  @override
  final String type;
  @override
  final String name;
  @override
  final String price;

  @override
  String toString() {
    return 'ItemInfoStateResponse(id: $id, type: $type, name: $name, price: $price)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ItemInfoStateResponse &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, type, name, price);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ItemInfoStateResponseCopyWith<_$_ItemInfoStateResponse> get copyWith =>
      __$$_ItemInfoStateResponseCopyWithImpl<_$_ItemInfoStateResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ItemInfoStateResponseToJson(
      this,
    );
  }
}

abstract class _ItemInfoStateResponse implements ItemInfoStateResponse {
  factory _ItemInfoStateResponse(
      {required final int id,
      required final String type,
      required final String name,
      required final String price}) = _$_ItemInfoStateResponse;

  factory _ItemInfoStateResponse.fromJson(Map<String, dynamic> json) =
      _$_ItemInfoStateResponse.fromJson;

  @override
  int get id;
  @override
  String get type;
  @override
  String get name;
  @override
  String get price;
  @override
  @JsonKey(ignore: true)
  _$$_ItemInfoStateResponseCopyWith<_$_ItemInfoStateResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
