// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'textbox_input_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TextboxInputState {
  String get title => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String get convertedMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TextboxInputStateCopyWith<TextboxInputState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TextboxInputStateCopyWith<$Res> {
  factory $TextboxInputStateCopyWith(
          TextboxInputState value, $Res Function(TextboxInputState) then) =
      _$TextboxInputStateCopyWithImpl<$Res, TextboxInputState>;
  @useResult
  $Res call({String title, String message, String convertedMessage});
}

/// @nodoc
class _$TextboxInputStateCopyWithImpl<$Res, $Val extends TextboxInputState>
    implements $TextboxInputStateCopyWith<$Res> {
  _$TextboxInputStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? message = null,
    Object? convertedMessage = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      convertedMessage: null == convertedMessage
          ? _value.convertedMessage
          : convertedMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TextboxInputStateCopyWith<$Res>
    implements $TextboxInputStateCopyWith<$Res> {
  factory _$$_TextboxInputStateCopyWith(_$_TextboxInputState value,
          $Res Function(_$_TextboxInputState) then) =
      __$$_TextboxInputStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String message, String convertedMessage});
}

/// @nodoc
class __$$_TextboxInputStateCopyWithImpl<$Res>
    extends _$TextboxInputStateCopyWithImpl<$Res, _$_TextboxInputState>
    implements _$$_TextboxInputStateCopyWith<$Res> {
  __$$_TextboxInputStateCopyWithImpl(
      _$_TextboxInputState _value, $Res Function(_$_TextboxInputState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? message = null,
    Object? convertedMessage = null,
  }) {
    return _then(_$_TextboxInputState(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      convertedMessage: null == convertedMessage
          ? _value.convertedMessage
          : convertedMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_TextboxInputState implements _TextboxInputState {
  _$_TextboxInputState(
      {required this.title,
      required this.message,
      required this.convertedMessage});

  @override
  final String title;
  @override
  final String message;
  @override
  final String convertedMessage;

  @override
  String toString() {
    return 'TextboxInputState(title: $title, message: $message, convertedMessage: $convertedMessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TextboxInputState &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.convertedMessage, convertedMessage) ||
                other.convertedMessage == convertedMessage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, title, message, convertedMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TextboxInputStateCopyWith<_$_TextboxInputState> get copyWith =>
      __$$_TextboxInputStateCopyWithImpl<_$_TextboxInputState>(
          this, _$identity);
}

abstract class _TextboxInputState implements TextboxInputState {
  factory _TextboxInputState(
      {required final String title,
      required final String message,
      required final String convertedMessage}) = _$_TextboxInputState;

  @override
  String get title;
  @override
  String get message;
  @override
  String get convertedMessage;
  @override
  @JsonKey(ignore: true)
  _$$_TextboxInputStateCopyWith<_$_TextboxInputState> get copyWith =>
      throw _privateConstructorUsedError;
}
