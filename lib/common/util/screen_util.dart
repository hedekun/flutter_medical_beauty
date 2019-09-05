import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenUtils {
  static setWidth(double width) {
    ScreenUtil.getInstance().setWidth(width);
  }

  static setHeight(double height) {
    ScreenUtil.getInstance().setHeight(height);
  }

  static setSp(double sp) {
    ScreenUtil.getInstance().setSp(sp);
  }

}
