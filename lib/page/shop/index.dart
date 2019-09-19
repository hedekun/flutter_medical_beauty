import 'package:flutter/material.dart';
import 'package:flutter_medical_beauty/common/style/colours.dart';
import 'package:flutter_medical_beauty/component/sliver/SliverPersisteneHeaderDelegate.dart';
import 'package:flutter_medical_beauty/page/shop/tabview/recommend.dart';
import 'package:flutter_medical_beauty/page/home/banner.dart';
import 'package:flutter_medical_beauty/page/home/custom_sliver_tab.dart';
import 'package:flutter_medical_beauty/page/home/navigation.dart';
import 'package:flutter_medical_beauty/store/data/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_medical_beauty/common/util/image_util.dart';

class ShopPage extends StatefulWidget {
  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage>
    with AutomaticKeepAliveClientMixin<ShopPage>, SingleTickerProviderStateMixin {
  TabController _tabController;
  final List<Tab> tabs = home_tabs.map((item) => Tab(text: item)).toList();
  final List<Widget> tabViewList = [RecommendPage(), RecommendPage(), RecommendPage(),RecommendPage(),RecommendPage(),RecommendPage()];

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: tabs.length);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: NestedScrollView(
          headerSliverBuilder: _headerSliverBuilder,
          body: TabBarView(
            physics: BouncingScrollPhysics(),
            controller: _tabController,
            children: tabViewList,
      )),
    );
  }

  List<Widget> _headerSliverBuilder(
      BuildContext context, bool innerBoxIsScrolled) {
    return <Widget>[
      SliverPersistentHeader(
        pinned: true,
        delegate: CustomSliverPersistentHeaderDelegate(
            max: ScreenUtil().setHeight(44),
            min: ScreenUtil().setHeight(44),
            child: NavigationPage()),
      ),
      SliverToBoxAdapter(child: BannerPage()),
      SliverToBoxAdapter(
        child: floorAd(),
      ),
      SliverToBoxAdapter(
        child: Container(
          color: Colours.workspace,
          width: double.infinity,
          height: 20,
        ),
      ),
      SliverPersistentTabBarPage(tabs: tabs, tabController: _tabController,),
    ];
  }

  Widget floorAd() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          loadAssetImage('head_image/floor_left',
              width: (MediaQuery.of(context).size.width - 38) / 2,
              fit: BoxFit.fitWidth),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              loadAssetImage('head_image/floor_right1',
                  width: (MediaQuery.of(context).size.width - 38) / 2,
                  fit: BoxFit.fitWidth),
              SizedBox(height: 4),
              loadAssetImage('head_image/floor_right2',
                  width: (MediaQuery.of(context).size.width - 38) / 2,
                  fit: BoxFit.fitWidth)
            ],
          )
        ],
      ),
    );
  }
}
