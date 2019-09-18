import 'package:flutter/material.dart';
import 'package:flutter_medical_beauty/common/style/colours.dart';
import 'package:flutter_medical_beauty/common/style/fontsize.dart';
import 'package:flutter_medical_beauty/page/discover/tabview/recommend.dart';
import 'package:flutter_medical_beauty/page/home/tabview/recommend.dart';

class FollowerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: <Widget>[
        SliverListRecommend(),
        SliverToBoxAdapter(
          child: FollowerForYouTitle(),
        ),
        SliverToBoxAdapter(
          child: RecommendDoctorContext(),
        )
      ],
    );
  }
}


class FollowerForYouTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('为你推荐', style: TextStyle(fontSize: FontSize.main_size)),
              Row(
                children: <Widget>[
                  Text('查看更多',
                      style: TextStyle(
                          fontSize: FontSize.small_size,
                          color: Colours.app_main)),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: FontSize.small_size,
                    color: Colours.app_main,
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
