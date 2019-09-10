import 'package:flutter/material.dart';
import 'package:flutter_medical_beauty/common/style/colours.dart';
import 'package:flutter_medical_beauty/component/sliver/SliverPersisteneHeaderDelegate.dart';

class SliverPersistentTabBarPage extends StatefulWidget {
  SliverPersistentTabBarPage({Key key, this.tabs, this.tabController}):super(key:key);
  final List<Tab> tabs;
  final TabController tabController;

  @override
  _SliverPersistentTabBarPage createState() => _SliverPersistentTabBarPage();
}

class _SliverPersistentTabBarPage extends State<SliverPersistentTabBarPage> with SingleTickerProviderStateMixin {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
//      floating: true,
      pinned: true,
      delegate: CustomSliverPersistentHeaderDelegate(
          max: 48,
          min: 48,
          child: Container(
            width: double.infinity,
            color: Colours.white_color,
            child: TabBar(
                tabs: widget.tabs,
                controller: widget.tabController,
                isScrollable: true,
                indicatorColor: Colours.app_main,
                labelColor: Colours.app_main,
                labelStyle: TextStyle(fontSize: 16),
                unselectedLabelColor: Colours.text_color,
                unselectedLabelStyle: TextStyle(fontSize: 15),
                indicatorSize: TabBarIndicatorSize.label),
          )),
    );
  }
}
