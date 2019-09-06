import 'package:flutter/material.dart';
import 'package:flutter_medical_beauty/common/util/image_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SliverFeaturePage extends StatelessWidget {
  final List<String> nameList= ['玻尿酸', '肉毒素', '眼部微整', '鼻综合', '面部轮廓', '自体脂肪', '胸部整形', '美体整形'];
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 10,
        childAspectRatio: 93.75/78
      ),
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            print(index);
          },
          child: Column(
            children: <Widget>[
              loadAssetImage('feature/${index+1}', fit: BoxFit.fill, width: ScreenUtil().setWidth(48), height: ScreenUtil().setHeight(52)),
              Text(nameList[index])
            ],
          )
        );
      }, childCount: 8),
    );
  }
}
