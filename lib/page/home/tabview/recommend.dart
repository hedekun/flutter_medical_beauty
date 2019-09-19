import 'package:flutter/material.dart';
import 'package:flutter_medical_beauty/common/util/image_util.dart';
import 'package:flutter_medical_beauty/common/style/colours.dart';
import 'package:flutter_medical_beauty/common/style/fontsize.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_medical_beauty/store/data/index.dart';
import 'package:flutter_medical_beauty/common/util/scroll_behavior.dart';

class RecommendPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: MyBehavior(),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverListRecommend()
        ],
      ),
    );
  }
}

class SliverListRecommend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
      return Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            _cardTitle(recommend_card_data[index]),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: loadAssetImage(recommend_card_data[index]['url'], width: ScreenUtil.screenWidth - 32, fit: BoxFit.fitWidth),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child:Text(recommend_card_data[index]['desc'], style: TextStyle(),maxLines: 2,overflow: TextOverflow.ellipsis,),
            ),
            _content(recommend_card_data[index]),
            _bottom(context, recommend_card_data[index]),
            Container(
              color: Colours.workspace,
              width: double.infinity,
              height: 20,
            ),
          ],
        ),
      );
    }, childCount: recommend_card_data.length));
  }

  Widget _cardTitle(data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                child: loadAssetImage(data['avatar'], width: 40, height: 40),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(data['title'], style: TextStyle(fontSize: FontSize.middle_size, color: Colours.text_color),),
                Text(data['title2'], style: TextStyle(fontSize: FontSize.small_size, color: Colours.recommend_title),)
              ],
            )
          ],
        ),
        Container(
          width: 66,
          height: 26,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(2)),
              border: Border.all(color: Colours.app_main, width: 1)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.add, color: Colours.app_main,),
              Text('关注', style: TextStyle(color: Colours.app_main, fontSize: FontSize.small_size),)
            ],
          ),
        )
      ],
    );
  }

  Widget _content(data) {
    return Container(
      height: 36,
      decoration: BoxDecoration(
        color: Colours.recommend_fill,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text(data['address'], style: TextStyle(fontSize: FontSize.small_size, color: Colours.recommend_fill_color),),
          Text(data['price'], style: TextStyle(color: Colours.app_main),)
        ],
      ),
    );
  }

  Widget _bottom(context, data) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(Icons.favorite_border, size: FontSize.small_size, color: Colours.recommend_title,),
              Text(data['like'], style: Theme.of(context).textTheme.body2,)
            ],
          ),
          SizedBox(width: 20,),
          Row(
            children: <Widget>[
              Icon(Icons.chat_bubble_outline, size: FontSize.small_size, color: Colours.recommend_title),
              Text(data['comment'], style: Theme.of(context).textTheme.body2,)
            ],
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(data['date'], style: Theme.of(context).textTheme.body2,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
