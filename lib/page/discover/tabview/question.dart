import 'package:flutter/material.dart';
import 'package:flutter_medical_beauty/common/style/colours.dart';
import 'package:flutter_medical_beauty/common/style/fontsize.dart';
import 'package:flutter_medical_beauty/common/util/image_util.dart';
import 'package:flutter_medical_beauty/store/data/index.dart';

class QuestionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: QuestionFilterTitle(),
        ),
        SliverAnswerList()
      ],
    );
  }
}

class QuestionFilterTitle extends StatefulWidget {
  @override
  _QuestionFilterTitleState createState() => _QuestionFilterTitleState();
}

class _QuestionFilterTitleState extends State<QuestionFilterTitle> {
  final List<String> allList = [
    '#全部',
    '#双眼皮',
    '#丰胸',
    '#隆鼻',
    '#玻尿酸',
  ];
  String select = '#双眼皮';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: allList.map((data) {
          return GestureDetector(
            onTap: () {
              setState(() {
                select = data;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
              height: 30,
              decoration: BoxDecoration(
                  gradient: select == data
                      ? LinearGradient(
                      colors: [Color(0xffff8fbc), Color(0xffff4c6a)])
                      : LinearGradient(
                      colors: [Color(0xfff7f9fc), Color(0xfff7f9fc)]),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Text(
                data,
                style: TextStyle(
                    color: select == data
                        ? Colours.white_color
                        : Colours.text_color),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class SliverAnswerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return Container(
            padding: EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: loadAssetImage('head_image/question'),
                ),
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width - 50,
                  padding: EdgeInsets.only(left: 12),
                  child: Column(
                    children: <Widget>[
                      _askTitle(ask_and_answer[index]),
                      _answer(context, ask_and_answer[index]),
                      SizedBox(height: 20,)
                    ],
                  ),
                )
              ],
            ));
      }, childCount: ask_and_answer.length),
    );
  }

  Widget _askTitle(data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: 1),
          child: Text( data['ask'],
            textAlign: TextAlign.start,),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Text(
            data['tag'],
            style: TextStyle(color: Colours.recommend_title),
          ),
        )
      ],
    );
  }

  Widget _answer(BuildContext context, data) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colours.border_color),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  loadAssetImage(data['avatar'],
                      width: 24, fit: BoxFit.fitWidth),
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text(data['answer_name']),
                  )
                ],
              ),
              Text(
                '${data['answer_time']}天前',
                style: TextStyle(fontSize: 14, color: Colours.recommend_title),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              data['answer_content'],
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(Icons.favorite_border,
                      size: FontSize.small_size,
                      color: Colours.recommend_title),
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child:
                    Text(data['like'], style: Theme
                        .of(context)
                        .textTheme
                        .body2),
                  )
                ],
              ),
              Text(
                '更多${data['answer_num']}个回答',
                style: TextStyle(
                    color: Colours.more_answer_color,
                    fontSize: FontSize.small_size),
              )
            ],
          )
        ],
      ),
    );
  }
}
