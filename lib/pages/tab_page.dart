import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flavor/components/alert_dialog.dart';
import 'package:test_flavor/components/custom_app_bar.dart';
import 'package:test_flavor/navigators/account_navigator.dart';
import 'package:test_flavor/navigators/chat_navigator.dart';
import 'package:test_flavor/providers/state/get_friend_info_state_notifier.dart';
import 'package:test_flavor/providers/state/get_item2_info_state_notifier.dart';
import 'package:test_flavor/providers/state/get_item_info_state_notifier.dart';

class TabPage extends StatelessWidget {
  const TabPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 6,
      child: Scaffold(
        appBar: CustomAppBar(
          title: 'TabBar',
          hasExitButton: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: Container(
              color: Colors.white,
              height: 50,
              child: TabBar(
                padding: EdgeInsets.zero,
                // isScrollable: true,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: Colors.blueAccent,
                ),
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.black,
                isScrollable: true,
                tabs: [
                  _buildTab('Tab'),
                  _buildTab('Tab 2です'),
                  _buildTab('Tab 3\nです'),
                  _buildTab('Tab 4です'),
                  _buildTab('Tab 5です'),
                  _buildTab('Tab 6です'),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            Tab1(),
            Tab2(),
            Center(child: Text('Tab 3 View')),
            Center(child: Text('Tab 4 View')),
            Center(child: Text('Tab 5 View')),
            Center(child: Text('Tab 6 View')),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(String title) {
    return Container(
      width: 50,
      padding: EdgeInsets.all(0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        border: Border.all(color: Colors.grey, width: 1),
      ),
      child: Align(
        alignment: Alignment.center,
        child: Text(title),
      ),
    );
  }
}

class Tab1 extends ConsumerWidget {
  const Tab1({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemProvider = ref.watch(getItemStateNotifierProvider);
    return itemProvider.when(
      data: (data) => Center(
        child: Column(
          children: [
            const Text('Tab 1 View'),
          ],
        ),
      ),
      loading: () => Center(
        child: Container(
          child: CircularProgressIndicator(),
        ),
      ),
      error: (error, stackTrace) {
        return Center(
          child: Container(
            child: Text('データの取得に失敗しました。'),
          ),
        );
      },
    );
  }
}

class Tab2 extends ConsumerWidget {
  const Tab2({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemProvider = ref.watch(getItem2StateNotifierProvider);
    return itemProvider.when(
      data: (data) => Center(
        child: Column(
          children: [
            const Text('Tab 2 View'),
          ],
        ),
      ),
      loading: () => Center(
        child: Container(
          child: CircularProgressIndicator(),
        ),
      ),
      error: (error, stackTrace) {
        return Center(
          child: Container(
            child: Text('データの取得に失敗しました。'),
          ),
        );
      },
    );
  }
}




///////////////////
///////////////////
///
///
///
//
// import 'package:flutter/material.dart';
// import 'package:test_flavor/components/custom_app_bar.dart';

// class TabPage extends StatefulWidget {
//   @override
//   _TabPageState createState() => _TabPageState();
// }

// class _TabPageState extends State<TabPage> with SingleTickerProviderStateMixin {
//   late TabController _tabController;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 5, vsync: this);
//     _tabController.addListener(() {
//       setState(() {}); // Tabの遷移が始まると再描画する
//     });
//   }

//   @override
//   void dispose() {
//     _tabController.removeListener(() {});
//     _tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(
//         title: 'Custom TabBar',
//         hasExitButton: true,
//         bottom: PreferredSize(
//           preferredSize: Size.fromHeight(50.0),
//           child: Container(
//             color: Colors.white,
//             width: Size.infinite.width,
//             child: SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: <Widget>[
//                   CustomTab(
//                     title: 'Tab 1',
//                     index: 0,
//                     tabController: _tabController,
//                   ),
//                   CustomTab(
//                     title: 'Tab 2',
//                     index: 1,
//                     tabController: _tabController,
//                   ),
//                   CustomTab(
//                     title: 'Tab 3',
//                     index: 2,
//                     tabController: _tabController,
//                   ),
//                   CustomTab(
//                     title: 'Tab 4',
//                     index: 3,
//                     tabController: _tabController,
//                   ),
//                   CustomTab(
//                     title: 'Tab 5',
//                     index: 4,
//                     tabController: _tabController,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//       body: TabBarView(
//         controller: _tabController,
//         children: <Widget>[
//           Center(child: Text('Tab 1 View')),
//           Center(child: Text('Tab 2 View')),
//           Center(child: Text('Tab 3 View')),
//           Center(child: Text('Tab 4 View')),
//           Center(child: Text('Tab 5 View')),
//         ],
//       ),
//     );
//   }
// }

// class CustomTab extends StatelessWidget {
//   final String title;
//   final int index;
//   final TabController tabController;

//   CustomTab({
//     required this.title,
//     required this.index,
//     required this.tabController,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 5.0),
//       width: 90,
//       child: GestureDetector(
//         onTap: () => tabController.animateTo(index),
//         child: AnimatedBuilder(
//           animation: tabController,
//           builder: (BuildContext context, Widget? child) {
//             return Container(
//               height: 50.0,
//               alignment: Alignment.center,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(2),
//                 border: Border.all(color: Colors.grey, width: 1),
//                 color:
//                     tabController.index == index ? Colors.blue : Colors.white,
//               ),
//               child: Text(
//                 title,
//                 style: TextStyle(
//                   color: Colors.black,
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
