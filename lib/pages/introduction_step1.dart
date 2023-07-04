import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flavor/components/custom_app_bar.dart';
import 'package:test_flavor/components/custom_button.dart';
import 'package:test_flavor/navigators/main_navigator.dart';

import 'package:test_flavor/providers/app_providers.dart';

class IntroductionStep1Page extends ConsumerWidget {
  const IntroductionStep1Page({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var provider = ref.watch(finishIntroductionProvider.notifier);
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Step1',
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                CustomButton(
                    onPressed: () {
                      ref.watch(finishIntroductionProvider.notifier).state =
                          true;
                      MainNavigator.toMain();
                    },
                    child: const Text('homeへ')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
