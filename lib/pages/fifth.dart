import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_flavor/components/alert_dialog.dart';
import 'package:test_flavor/components/success_dialog.dart';
import 'package:test_flavor/entity/state/textbox_input_state.dart';
import 'package:test_flavor/navigators/home_navigator.dart';
import 'package:test_flavor/providers/state/get_item_info_state_notifier.dart';
import 'package:test_flavor/providers/repository/update_user_notifier.dart';
import 'package:test_flavor/providers/state/user_info_state_notifier.dart';
import 'package:test_flavor/utils/loading_handler.dart';
import 'package:test_flavor/utils/show_timer_dialog.dart';

class Fifth extends ConsumerWidget {
  Fifth({super.key});
  final _formKey = GlobalKey<FormState>();
  FocusNode _focusNode = FocusNode();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textboxInputState = ref.read(textBoxInputStateProvider);
    final textboxInputStateNotifier =
        ref.read(textBoxInputStateProvider.notifier);
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Text('hello'),
              TextFormField(
                initialValue: textboxInputState.title,
                focusNode: _focusNode,
                maxLength: 10,
                onChanged: (value) {
                  textboxInputStateNotifier.setTitle(value);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                initialValue: textboxInputState.message,
                maxLength: 10,
                onChanged: (value) {
                  textboxInputStateNotifier.setMessage(value);
                  textboxInputStateNotifier.convertMessageAndSave(value);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              //
              //Consumerウィジェットを使うと、providerの値が変更されたときに親ウィジェットの再構築を防ぐことができる。
              //（コンポーネント化しても同じことができる）
              Consumer(
                builder: (context, refx, child) {
                  final message =
                      refx.watch(textBoxInputStateProvider).convertedMessage;
                  return Text(message);
                },
              ),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // バリデーションが成功した後の処理
                  }
                },
                child: Text('Submit'),
              ),
              ElevatedButton(
                onPressed: () {
                  ref.read(textBoxInputStateProvider.notifier).setTextboxInput(
                        title: '',
                        message: '',
                        convertedMessage: '',
                      );
                  _formKey.currentState!.reset();
                  _focusNode.requestFocus();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  textStyle: TextStyle(
                      fontSize: ScreenUtil().setSp(18.h < 18 ? 18 : 18.h)),
                ),
                child: const Text('Reset'),
              ),
              Text(
                'hello',
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize,
                  color: Colors.red,
                ),
              ),
              Text('hello'),
              Text('hello'),
            ],
          ),
        ),
      ),
    );
  }
}

class TextBoxInputStateNotifier extends StateNotifier<TextboxInputState> {
  TextBoxInputStateNotifier()
      : super(TextboxInputState(title: '', message: '', convertedMessage: ''));

  void setTextboxInput(
      {String? title, String? message, String? convertedMessage}) {
    state = state.copyWith(
      title: title ?? state.title,
      message: message ?? state.message,
      convertedMessage: message ?? state.convertedMessage,
    );
  }

  void setTitle(
    String? title,
  ) {
    state = state.copyWith(
      title: title ?? state.title,
    );
  }

  void setMessage(String? message) {
    state = state.copyWith(
      message: message ?? state.message,
    );
  }

  void convertMessageAndSave(String message) {
    String convertedMessage = message.replaceAll('な', 'にゃ');

    convertedMessage = convertedMessage.replaceAll('ます。', 'ますにゃ。');
    convertedMessage = convertedMessage.replaceAll('です。', 'ですにゃ。');
    convertedMessage = convertedMessage.replaceAll('た。', 'たにゃ。');
    convertedMessage = convertedMessage.replaceAll('だ。', 'だにゃ。');
    convertedMessage = convertedMessage.replaceAll('だ。', 'だにゃ。');
    state = state.copyWith(
      convertedMessage: convertedMessage ?? state.convertedMessage,
    );
  }
}

final textBoxInputStateProvider =
    StateNotifierProvider<TextBoxInputStateNotifier, TextboxInputState>((ref) {
  return TextBoxInputStateNotifier();
});
