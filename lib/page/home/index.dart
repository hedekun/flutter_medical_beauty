import 'package:flutter/material.dart';
import 'package:flutter_medical_beauty/common/style/colours.dart';
import 'package:flutter_medical_beauty/page/home/navigation.dart';
import 'package:flutter_medical_beauty/page/home/banner.dart';
import 'package:flutter_medical_beauty/page/home/feature.dart';
import 'package:flutter_medical_beauty/page/home/position.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {

  @protected
  bool get wantKeepAlive=>true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        physics: ScrollPhysics(),
        slivers: <Widget>[
          SliverToBoxAdapter(child: NavigationPage()),
          SliverToBoxAdapter(child: BannerPage()),
          SliverToBoxAdapter(child: SizedBox(height: 12)),
          SliverFeaturePage(),
          SliverToBoxAdapter(child: PositionPage()),
          SliverToBoxAdapter(child: Container(
            color: Colours.workspace,
            width: double.infinity,
            height: 20,
          ),)
        ],
      ),
    );
  }


}
