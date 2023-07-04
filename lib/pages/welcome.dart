import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flavor/components/custom_app_bar.dart';
import 'package:test_flavor/components/custom_button.dart';
import 'package:test_flavor/navigators/main_navigator.dart';

class WellcomePage extends ConsumerWidget {
  const WellcomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'welcome',
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                CustomButton(
                    onPressed: () => MainNavigator.toStep1(),
                    child: const Text('Step1へ')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
