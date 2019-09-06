import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_medical_beauty/common/style/colours.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_medical_beauty/common/util/image_util.dart';

class BannerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: ScreenUtil().setWidth(343),
        height: ScreenUtil().setHeight(164),
        color: Colours.white_color,
        padding: EdgeInsets.only(top: 12),
        child: Swiper(
            itemCount: 2,
            autoplay: true,
            itemBuilder: (BuildContext context, int index) {
              return loadAssetImage('banner/${index+1}', format: 'png', fit: BoxFit.fill);
            },
            pagination: SwiperCustomPagination(builder: (BuildContext context, SwiperPluginConfig config) {
              return Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: _bannerPagination(config)
                ),
              );
            }),
            autoplayDelay: 6000
        ),
      ),
    );
  }

  List<Widget> _bannerPagination(SwiperPluginConfig config) {
    var itemCount = config.itemCount;
    var activeIndex = config.activeIndex;
    List<Widget> list = [];

    for (int i = 0; i < itemCount; ++i) {
      bool active = i == activeIndex;
      list.add(Container(
        key: Key("pagination_$i"),
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
        child: Container(
          width: active ? 10 : 6,
          height: 2,
          decoration: BoxDecoration(
            color: active ? Colors.white : Colors.black38,
            borderRadius: BorderRadius.all(Radius.circular(1))
          ),
        ),
      ));
    }
    return list;
  }

}
