import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flavor/components/alert_dialog.dart';
import 'package:test_flavor/components/custom_app_bar.dart';
import 'package:test_flavor/navigators/account_navigator.dart';
import 'package:test_flavor/navigators/chat_navigator.dart';
import 'package:test_flavor/providers/state/get_item_info_state_notifier.dart';
import 'package:test_flavor/utils/size_config.dart';

class SelectoraPage extends ConsumerWidget {
  const SelectoraPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemProvider = ref.watch(getItemStateNotifierProvider);
    SizeConfig.init(context); //初期化
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Selector',
        hasExitButton: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: itemProvider.when(
            data: (items) => Center(
              child: Wrap(
                children: [
                  for (var item in items)
                    InkWell(
                      onTap: () {
                        // setState(() {
                        //   _count++;
                        // });
                      },
                      child: Container(
                        margin: EdgeInsets.all(10),
                        width:
                            SizeConfig.vw(150, minLimit: false, maxLimit: true),
                        height:
                            SizeConfig.vh(170, minLimit: false, maxLimit: true),
                        child: Center(
                          child: Column(
                            children: [
                              Text(item.name),
                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.pink),
                        ),
                      ),
                      splashColor: Colors.pink,
                    ),
                ],
              ),

              // return Text(items[index].name);
            ),
            loading: () => Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            ),
            error: (error, stackTrace) {
              WidgetsBinding.instance.addPostFrameCallback(
                (_) {
                  showDialog(
                      context: context,
                      builder: (_) => NetworkErrorDialog(errorCode: error));
                },
              );
              return Center(
                child: Container(
                  child: Text('データの取得に失敗しました。'),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
