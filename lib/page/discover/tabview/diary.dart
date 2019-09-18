import 'package:flutter/material.dart';
import 'package:flutter_medical_beauty/page/home/tabview/recommend.dart';

class DiaryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: <Widget>[
        SliverListRecommend()
      ],
    );
  }
}
