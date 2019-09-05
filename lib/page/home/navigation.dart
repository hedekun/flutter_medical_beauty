import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_medical_beauty/common/style/fontsize.dart';
import 'package:flutter_medical_beauty/common/style/colours.dart';

class NavigationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: ScreenUtil().setHeight(44),
      alignment: Alignment.center,
      color: Colours.white_color,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _address(),
          SizedBox(width: 10),
          _search(),
          SizedBox(width: 10),
          Text('签到', style: TextStyle(fontSize: ScreenUtil().setSp(FontSize.middle_size)),),
        ],
      ),
    );
  }


  Widget _address() {
    return Row(
      children: <Widget>[
        Text('武汉', style: TextStyle(fontSize: ScreenUtil().setSp(FontSize.middle_size)),),
        Icon(Icons.keyboard_arrow_down)
      ],
    );
  }

  Widget _search() {
    return Container(
      width: ScreenUtil().setWidth(240),
      height: ScreenUtil().setHeight(32),
      decoration: BoxDecoration(
        border: Border.all(color: Colours.navigator_color, width: ScreenUtil().setWidth(1)),
//        color: Colours.navigator_filled,
        borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setHeight(16)))
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.search, size: ScreenUtil().setWidth(FontSize.main_size),),
            SizedBox(width: ScreenUtil().setWidth(8),),
            Text('大家都在搜  双眼皮', style: TextStyle(fontSize: ScreenUtil().setSp(FontSize.small_size)),)
          ],
        ),
      ),
    );
  }
}
