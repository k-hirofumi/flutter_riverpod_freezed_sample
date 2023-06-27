import 'package:flutter/material.dart';
import 'package:test_flavor/components/custom_app_bar.dart';

class TabPage extends StatefulWidget {
  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollController;
  static const int tabCount = 7;
  static const double tabWidth = 100;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabCount, vsync: this);
    _scrollController = ScrollController();
    _tabController.addListener(() {
      setState(() {}); // Tabの遷移が始まると再描画する
      print('tabChange');

      print(_tabController.indexIsChanging);
      // タブの遷移に合わせてスクロール位置を調整する
      if (_tabController.index != _tabController.previousIndex) {
        print('indexIsChanging');
        _scrollToSelectedTab();
      }
    });
  }

  void _scrollToSelectedTab() {
    final int tabIndex = _tabController.index;

    if (_scrollController.position.viewportDimension < tabCount * tabWidth) {
      if (_scrollController.position.viewportDimension <
          2 * tabWidth + (tabCount - (tabIndex + 1)) * tabWidth) {
        _scrollController.animateTo(
          (tabIndex < 1 ? 0 : (tabIndex - 1)) * tabWidth,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      } else {
        _scrollController.animateTo(
          tabCount * tabWidth - _scrollController.position.viewportDimension,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    }
  }

  @override
  void dispose() {
    _tabController.removeListener(() {});
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Custom TabBar',
        hasExitButton: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: Container(
            color: Colors.white,
            width: Size.infinite.width,
            child: SingleChildScrollView(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  CustomTab(
                    title: 'Tab 1',
                    index: 0,
                    tabController: _tabController,
                    tabWidth: tabWidth,
                  ),
                  CustomTab(
                    title: 'Tab 2',
                    index: 1,
                    tabController: _tabController,
                    tabWidth: tabWidth,
                  ),
                  CustomTab(
                    title: 'Tab 3',
                    index: 2,
                    tabController: _tabController,
                    tabWidth: tabWidth,
                  ),
                  CustomTab(
                    title: 'Tab 4',
                    index: 3,
                    tabController: _tabController,
                    tabWidth: tabWidth,
                  ),
                  CustomTab(
                    title: 'Tab 5',
                    index: 4,
                    tabController: _tabController,
                    tabWidth: tabWidth,
                  ),
                  CustomTab(
                    title: 'Tab 6',
                    index: 5,
                    tabController: _tabController,
                    tabWidth: tabWidth,
                  ),
                  CustomTab(
                    title: 'Tab 7',
                    index: 6,
                    tabController: _tabController,
                    tabWidth: tabWidth,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Center(child: Text('Tab 1 View')),
          Center(child: Text('Tab 2 View')),
          Center(child: Text('Tab 3 View')),
          Center(child: Text('Tab 4 View')),
          Center(child: Text('Tab 5 View')),
          Center(child: Text('Tab 6 View')),
          Center(child: Text('Tab 7 View')),
        ],
      ),
    );
  }
}

class CustomTab extends StatelessWidget {
  final String title;
  final int index;
  final TabController tabController;
  final double tabWidth;

  CustomTab({
    required this.title,
    required this.index,
    required this.tabController,
    required this.tabWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: tabWidth * 0.05),
      width: tabWidth * 0.9,
      child: GestureDetector(
        onTap: () => tabController.animateTo(index),
        child: AnimatedBuilder(
          animation: tabController,
          builder: (BuildContext context, Widget? child) {
            return Container(
              height: 50.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                border: Border.all(color: Colors.grey, width: 1),
                color:
                    tabController.index == index ? Colors.blue : Colors.white,
              ),
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

///////////////////
///////////////////


// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:test_flavor/components/alert_dialog.dart';
// import 'package:test_flavor/components/custom_app_bar.dart';
// import 'package:test_flavor/navigators/account_navigator.dart';
// import 'package:test_flavor/navigators/chat_navigator.dart';
// import 'package:test_flavor/providers/state/get_friend_info_state_notifier.dart';
// import 'package:test_flavor/providers/state/get_item2_info_state_notifier.dart';
// import 'package:test_flavor/providers/state/get_item_info_state_notifier.dart';

// class TabPage extends StatelessWidget {
//   const TabPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       initialIndex: 0,
//       length: 8,
//       child: Scaffold(
//         appBar: CustomAppBar(
//           title: 'TabBar',
//           hasExitButton: true,
//           bottom: PreferredSize(
//             preferredSize: const Size.fromHeight(50),
//             child: Container(
//               color: Colors.white,
//               height: 50,
//               child: TabBar(
//                 padding: EdgeInsets.zero,
//                 // isScrollable: true,
//                 indicator: BoxDecoration(
//                   borderRadius: BorderRadius.circular(2),
//                   color: Colors.blueAccent,
//                 ),
//                 indicatorSize: TabBarIndicatorSize.tab,
//                 labelColor: Colors.black,
//                 unselectedLabelColor: Colors.black,
//                 isScrollable: true,
//                 tabs: <Widget>[
//                   Tab(text: '野球'),
//                   Tab(text: 'サッカー'),
//                   Tab(text: 'テニス'),
//                   Tab(text: 'バスケ'),
//                   Tab(text: '剣道'),
//                   Tab(text: '柔道'),
//                   Tab(text: '水泳'),
//                   Tab(text: '卓球'),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         body: TabBarView(
//           children: <Widget>[
//             Center(
//               child: Text('野球', style: TextStyle(fontSize: 32.0)),
//             ),
//             Center(
//               child: Text('サッカー', style: TextStyle(fontSize: 32.0)),
//             ),
//             Center(
//               child: Text('テニス', style: TextStyle(fontSize: 32.0)),
//             ),
//             Center(
//               child: Text('バスケ', style: TextStyle(fontSize: 32.0)),
//             ),
//             Center(
//               child: Text('剣道', style: TextStyle(fontSize: 32.0)),
//             ),
//             Center(
//               child: Text('柔道', style: TextStyle(fontSize: 32.0)),
//             ),
//             Center(
//               child: Text('水泳', style: TextStyle(fontSize: 32.0)),
//             ),
//             Center(
//               child: Text('卓球', style: TextStyle(fontSize: 32.0)),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// //   Widget _buildTab(String title) {
// //     return Container(
// //       width: 50,
// //       padding: EdgeInsets.all(0),
// //       decoration: BoxDecoration(
// //         borderRadius: BorderRadius.circular(2),
// //         border: Border.all(color: Colors.grey, width: 1),
// //       ),
// //       child: Align(
// //         alignment: Alignment.center,
// //         child: Text(title),
// //       ),
// //     );
// //   }
// // }

// // class Tab1 extends ConsumerWidget {
// //   const Tab1({super.key});

// //   @override
// //   Widget build(BuildContext context, WidgetRef ref) {
// //     final itemProvider = ref.watch(getItemStateNotifierProvider);
// //     return itemProvider.when(
// //       data: (data) => Center(
// //         child: Column(
// //           children: [
// //             const Text('Tab 1 View'),
// //           ],
// //         ),
// //       ),
// //       loading: () => Center(
// //         child: Container(
// //           child: CircularProgressIndicator(),
// //         ),
// //       ),
// //       error: (error, stackTrace) {
// //         return Center(
// //           child: Container(
// //             child: Text('データの取得に失敗しました。'),
// //           ),
// //         );
// //       },
// //     );
// //   }
// // }

// // class Tab2 extends ConsumerWidget {
// //   const Tab2({super.key});

// //   @override
// //   Widget build(BuildContext context, WidgetRef ref) {
// //     final itemProvider = ref.watch(getItem2StateNotifierProvider);
// //     return itemProvider.when(
// //       data: (data) => Center(
// //         child: Column(
// //           children: [
// //             const Text('Tab 2 View'),
// //           ],
// //         ),
// //       ),
// //       loading: () => Center(
// //         child: Container(
// //           child: CircularProgressIndicator(),
// //         ),
// //       ),
// //       error: (error, stackTrace) {
// //         return Center(
// //           child: Container(
// //             child: Text('データの取得に失敗しました。'),
// //           ),
// //         );
// //       },
// //     );
// //   }
// // }

