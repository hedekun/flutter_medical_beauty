import 'package:flutter/material.dart';
import 'package:flutter_medical_beauty/page/home/tabview/recommend.dart';
import 'package:flutter_medical_beauty/common/style/colours.dart';
import 'package:flutter_medical_beauty/common/style/fontsize.dart';
import 'package:flutter_medical_beauty/common/util/image_util.dart';
import 'package:flutter_medical_beauty/store/data/index.dart';

class RecommendPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: RecommendDoctorTitle(),
        ),
        SliverToBoxAdapter(
          child: RecommendDoctorContext(),
        ),
        SliverToBoxAdapter(
          child: RecommendTopicTitle(),
        ),
        SliverTopicContext(),
        SliverListRecommend()
      ],
    );
  }
}

// 优选医师标题
class RecommendDoctorTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('优选医师', style: TextStyle(fontSize: FontSize.main_size)),
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

// 优选医师列表
class RecommendDoctorContext extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: discover_doctor.length,
        itemBuilder: (BuildContext context, int index) {
          return _doctorCard(context, discover_doctor[index]);
        },
      ),
    );
  }

  Widget _doctorCard(context, data) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      width: 140,
      height: 170,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: Colours.navigator_filled)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          loadAssetImage(data['avatar'], width: 50, fit: BoxFit.fitWidth),
          Text(data['name']),
          Text(
            data['job'],
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

// 热门话题标题
class RecommendTopicTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Text('热门话题', style: TextStyle(fontSize: FontSize.main_size)),
    );
  }
}

// 热门话题
class SliverTopicContext extends StatelessWidget {
  final List<Color> background = [
    Color(0xFFFFF9ED),
    Color(0xFFEBF8FF),
    Color(0xFFFFF6F5),
    Color(0xFFF5F5FF)
  ];
  final List<Color> fontColor = [
    Color(0xFFFF961F),
    Color(0xFF29A9FF),
    Color(0xFFFF7857),
    Color(0xFF8080FF)
  ];
  final List<String> fontText = ['# 脂肪拆迁队', '# 90°侧颜杀', '# 2米大长腿', '# 我和明星撞脸啦'];

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 165 / 44),
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          return Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: background[index],
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: Text(
              fontText[index],
              style: TextStyle(color: fontColor[index]),
            ),
          );
        }, childCount: 4),
      ),
    );
  }
}
