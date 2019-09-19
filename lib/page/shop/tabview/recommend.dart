import 'package:flutter/material.dart';
import 'package:flutter_medical_beauty/common/util/image_util.dart';
import 'package:flutter_medical_beauty/common/util/scroll_behavior.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_medical_beauty/common/style/fontsize.dart';
import 'package:flutter_medical_beauty/common/style/colours.dart';

class RecommendPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: MyBehavior(),
      child: CustomScrollView(
        slivers: <Widget>[SliverListRecommend()],
      ),
    );
  }
}

class SliverListRecommend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.all(16),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          return Column(
            children: <Widget>[
              Container(
                height: ScreenUtil().setWidth(100),
                child: Row(
                  children: <Widget>[
                    loadAssetImage('head_image/head',
                        width: ScreenUtil().setWidth(100), fit: BoxFit.fitWidth),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('注射隆鼻·一针提升高“鼻”格'),
                          Text(
                            '武汉贵美和颐外科整形医院',
                            style: TextStyle(
                                fontSize: FontSize.small_size,
                                color: Colours.recommend_title),
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 3),
                                decoration: BoxDecoration(
                                  border: Border.all(width: 1,color: Colours.app_main),
                                  borderRadius: BorderRadius.all(Radius.circular(2)),
                                ),
                                child: Text('分期', style: TextStyle(fontSize: FontSize.mini_size, color: Colours.app_main),),
                              ),
                              SizedBox(width: 5),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 3),
                                decoration: BoxDecoration(
                                  border: Border.all(width: 1,color: Colours.shop_tag_color),
                                  borderRadius: BorderRadius.all(Radius.circular(2)),
                                ),
                                child: Text('保险', style: TextStyle(fontSize: FontSize.mini_size, color: Colours.shop_tag_color),),
                              )
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text('￥1680', style: TextStyle(fontSize: FontSize.main_size, color:Colours.app_main),),
                              SizedBox(width: 5,),
                              Text('￥1980', style: TextStyle(fontSize: FontSize.small_size, color: Colours.recommend_title, decoration: TextDecoration.lineThrough),)
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Divider(color: Colours.border_color,height: 1,indent: 110,),
              )
            ],
          );
        }, childCount: 10),
      ),
    );
  }
}
