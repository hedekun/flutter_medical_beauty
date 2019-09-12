import 'package:flutter/material.dart';
import 'package:flutter_medical_beauty/common/style/colours.dart';
import 'package:flutter_medical_beauty/common/style/fontsize.dart';
import 'package:flutter_medical_beauty/common/util/image_util.dart';
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

  Widget _doctorCard(context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      width: (MediaQuery.of(context).size.width - 32 - 20) / 3,
      height: 170,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: Colours.navigator_filled)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          loadAssetImage('head_image/5', width: 50, fit: BoxFit.fitWidth),
          Text('赵志明'),
          Text(
            '高级医师',
            style: TextStyle(
                color: Colours.recommend_title, fontSize: FontSize.small_size),
          ),
          SizedBox(height: 10),
          Container(
            width: 66,
            height: 26,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(2)),
              border: Border.all(color: Colours.app_main, width: 1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.add,
                  color: Colours.app_main,
                ),
                Text(
                  '关注',
                  style: TextStyle(
                      color: Colours.app_main, fontSize: FontSize.small_size),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
