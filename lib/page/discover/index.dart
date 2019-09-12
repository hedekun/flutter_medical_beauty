import 'package:flutter/material.dart';
import 'package:flutter_medical_beauty/common/style/colours.dart';
import 'package:flutter_medical_beauty/common/style/fontsize.dart';
import 'package:flutter_medical_beauty/component/sliver/SliverPersisteneHeaderDelegate.dart';
import 'package:flutter_medical_beauty/store/data/index.dart';
import 'package:flutter_medical_beauty/page/discover/tabview/recommend.dart';
import 'package:flutter_medical_beauty/page/discover/tabview/follower.dart';
import 'package:flutter_medical_beauty/page/discover/tabview/question.dart';
import 'package:flutter_medical_beauty/page/discover/tabview/diary.dart';
import 'package:flutter_medical_beauty/page/discover/tabview/video.dart';
import 'package:flutter_medical_beauty/page/discover/tabview/doctor_say.dart';

class DiscoverPage extends StatefulWidget {
  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  TabController _tabController;
  final List<Widget> _tabViewList = [RecommendPage(), FollowerPage(), QuestionPage(), DiaryPage(), VideoPage(), DocotrSayPage()];

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: discover_tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: NestedScrollView(
        physics: BouncingScrollPhysics(),
        headerSliverBuilder: _headerSliverBuilder,
        body: TabBarView(children: _tabViewList, controller: _tabController),
      ),
    );
  }

  List<Widget> _headerSliverBuilder(
      BuildContext context, bool innerBoxScorlled) {
    return [
      SliverPersistentHeader(
        pinned: true,
        floating: true,
        delegate: CustomSliverPersistentHeaderDelegate(
            max: 44,
            min: 44,
            child: Container(
              width: double.infinity,
              height: 44,
              color: Colours.white_color,
              child: TabBar(
                tabs: discover_tabs.map((item) => Tab(text: item)).toList(),
                controller: _tabController,
                isScrollable: true,
                labelColor: Colours.app_main,
                indicator: const BoxDecoration(),
                labelStyle: TextStyle(fontSize: FontSize.special_size),
                unselectedLabelColor: Colours.text_color,
                unselectedLabelStyle: TextStyle(fontSize: FontSize.middle_size),
              ),
            )),
      )
    ];
  }
}
