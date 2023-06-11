// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_info_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ItemInfoState _$ItemInfoStateFromJson(Map<String, dynamic> json) {
  return _ItemInfoState.fromJson(json);
}

/// @nodoc
mixin _$ItemInfoState {
  int get id => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemInfoStateCopyWith<ItemInfoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemInfoStateCopyWith<$Res> {
  factory $ItemInfoStateCopyWith(
          ItemInfoState value, $Res Function(ItemInfoState) then) =
      _$ItemInfoStateCopyWithImpl<$Res, ItemInfoState>;
  @useResult
  $Res call({int id, String type, String name, String price});
}

/// @nodoc
class _$ItemInfoStateCopyWithImpl<$Res, $Val extends ItemInfoState>
    implements $ItemInfoStateCopyWith<$Res> {
  _$ItemInfoStateCopyWithImpl(this._value, this._then);

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
abstract class _$$_ItemInfoStateCopyWith<$Res>
    implements $ItemInfoStateCopyWith<$Res> {
  factory _$$_ItemInfoStateCopyWith(
          _$_ItemInfoState value, $Res Function(_$_ItemInfoState) then) =
      __$$_ItemInfoStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String type, String name, String price});
}

/// @nodoc
class __$$_ItemInfoStateCopyWithImpl<$Res>
    extends _$ItemInfoStateCopyWithImpl<$Res, _$_ItemInfoState>
    implements _$$_ItemInfoStateCopyWith<$Res> {
  __$$_ItemInfoStateCopyWithImpl(
      _$_ItemInfoState _value, $Res Function(_$_ItemInfoState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? name = null,
    Object? price = null,
  }) {
    return _then(_$_ItemInfoState(
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
class _$_ItemInfoState implements _ItemInfoState {
  _$_ItemInfoState(
      {required this.id,
      required this.type,
      required this.name,
      required this.price});

  factory _$_ItemInfoState.fromJson(Map<String, dynamic> json) =>
      _$$_ItemInfoStateFromJson(json);

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
    return 'ItemInfoState(id: $id, type: $type, name: $name, price: $price)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ItemInfoState &&
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
  _$$_ItemInfoStateCopyWith<_$_ItemInfoState> get copyWith =>
      __$$_ItemInfoStateCopyWithImpl<_$_ItemInfoState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ItemInfoStateToJson(
      this,
    );
  }
}

abstract class _ItemInfoState implements ItemInfoState {
  factory _ItemInfoState(
      {required final int id,
      required final String type,
      required final String name,
      required final String price}) = _$_ItemInfoState;

  factory _ItemInfoState.fromJson(Map<String, dynamic> json) =
      _$_ItemInfoState.fromJson;

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
  _$$_ItemInfoStateCopyWith<_$_ItemInfoState> get copyWith =>
      throw _privateConstructorUsedError;
}
