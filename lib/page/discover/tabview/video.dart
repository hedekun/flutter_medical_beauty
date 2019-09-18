import 'package:flutter/material.dart';
import 'package:flutter_medical_beauty/common/style/colours.dart';
import 'package:flutter_medical_beauty/common/style/fontsize.dart';
import 'package:flutter_medical_beauty/common/util/image_util.dart';

class VideoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Center(
          child: GridView.builder(
            physics: BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 164 / 324),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                loadAssetImage('head_image/video'),
                Text('双眼皮恢复差不多了赶脚自己美美哒~ 夜~'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        loadAssetImage('head_image/2',
                            width: 20, fit: BoxFit.fitWidth),
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text('小仙女'),
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.favorite_border,
                            size: FontSize.small_size),
                        Padding(
                          padding: EdgeInsets.only(left: 5),
                          child:
                          Text('564', style: TextStyle(fontSize: FontSize.small_size),),
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          );
        },
        itemCount: 4,
      )),
    );
  }
}
