import 'package:flutter/material.dart';
import 'package:flutter_medical_beauty/common/style/colours.dart';
import 'package:flutter_medical_beauty/common/style/fontsize.dart';
import 'package:flutter_medical_beauty/common/util/image_util.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage>
    with AutomaticKeepAliveClientMixin<MinePage> {
  final List<String> list1 = ['我的关注', '我的收藏', '浏览记录'];
  final List<String> list2 = ['意见反馈', '关于我们'];

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Theme(
      data: ThemeData(scaffoldBackgroundColor: Colours.background_color),
      child: Scaffold(
          body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: <Widget>[
              _info(),
              _myOrder(),
              SizedBox(
                height: 10,
              ),
              _listFirst(list1),
              SizedBox(
                height: 10,
              ),
              _listFirst(list2)
            ],
          ),
        ),
      )),
    );
  }

  Widget _info() {
    return Container(
      width: double.infinity,
      height: 227,
      decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [Color(0xffff7db3), Color(0xffff456a)])),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Icon(Icons.comment, color: Colours.white_color, size: 20),
              SizedBox(width: 20),
              Icon(Icons.settings, color: Colours.white_color, size: 20),
              SizedBox(width: 16),
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 16, right: 8),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(28)),
                  child: loadAssetImage('head_image/mine',
                      width: 56, height: 56, fit: BoxFit.cover),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        '杨美娜',
                        style: TextStyle(
                            color: Colours.white_color,
                            fontSize: FontSize.main_size),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        padding:
                            EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                          Color(0xffffd046),
                          Color(0xffff9a29)
                        ])),
                        child: Text(
                          'V2',
                          style: TextStyle(
                              color: Colours.white_color,
                              fontSize: FontSize.mini_size),
                        ),
                      )
                    ],
                  ),
                  Text(
                    '编辑个人资料',
                    style: TextStyle(color: Colours.white_color),
                  )
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    '12',
                    style: TextStyle(
                        fontSize: FontSize.main_size,
                        color: Colours.white_color),
                  ),
                  Text(
                    '日记',
                    style: TextStyle(
                        fontSize: FontSize.middle_size,
                        color: Colours.white_color),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  Text(
                    '24',
                    style: TextStyle(
                        fontSize: FontSize.main_size,
                        color: Colours.white_color),
                  ),
                  Text(
                    '粉丝',
                    style: TextStyle(
                        fontSize: FontSize.middle_size,
                        color: Colours.white_color),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  Text(
                    '4',
                    style: TextStyle(
                        fontSize: FontSize.main_size,
                        color: Colours.white_color),
                  ),
                  Text(
                    '问答',
                    style: TextStyle(
                        fontSize: FontSize.middle_size,
                        color: Colours.white_color),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  Text(
                    '16',
                    style: TextStyle(
                        fontSize: FontSize.main_size,
                        color: Colours.white_color),
                  ),
                  Text(
                    '视频',
                    style: TextStyle(
                        fontSize: FontSize.middle_size,
                        color: Colours.white_color),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _myOrder() {
    return Container(
      color: Colours.white_color,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('我的订单'),
              Row(
                children: <Widget>[
                  Text(
                    '查看全部',
                    style: TextStyle(
                        color: Colours.recommend_title,
                        fontSize: FontSize.middle_size),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colours.recommend_title,
                    size: FontSize.middle_size,
                  )
                ],
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    loadAssetImage(
                      'head_image/will_pay',
                      width: 30,
                      height: 30,
                    ),
                    Text(
                      '待付款',
                      style: TextStyle(fontSize: FontSize.help_size),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    loadAssetImage(
                      'head_image/can_use',
                      width: 30,
                      height: 30,
                    ),
                    Text(
                      '可使用',
                      style: TextStyle(fontSize: FontSize.help_size),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    loadAssetImage(
                      'head_image/will_evaluation',
                      width: 30,
                      height: 30,
                    ),
                    Text(
                      '待评价',
                      style: TextStyle(fontSize: FontSize.help_size),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    loadAssetImage(
                      'head_image/refund',
                      width: 30,
                      height: 30,
                    ),
                    Text(
                      '退款售后',
                      style: TextStyle(fontSize: FontSize.help_size),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _listFirst(listData) {
    return Container(
      color: Colours.white_color,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: listData.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(listData[index]),
            trailing: Icon(Icons.keyboard_arrow_right),
          );
        },
      ),
    );
  }
}
