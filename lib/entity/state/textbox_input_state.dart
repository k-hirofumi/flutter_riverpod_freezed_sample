import 'package:freezed_annotation/freezed_annotation.dart';

part 'textbox_input_state.freezed.dart';

@freezed
class TextboxInputState with _$TextboxInputState {
  factory TextboxInputState({
    required String title,
    required String message,
    required String convertedMessage,
  }) = _TextboxInputState;

  // factory UserInfoEntity.fromJson(Map<String, dynamic> json) =>
  //     _$UserInfoEntityFromJson(json);
}
