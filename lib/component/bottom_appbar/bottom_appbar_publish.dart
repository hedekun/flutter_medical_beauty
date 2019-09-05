import 'package:flutter/material.dart';
import 'package:flutter_medical_beauty/common/util/image_util.dart';

class BottomAppBarPublish extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: loadAssetImage('home/publish', format: 'jpg'),
    );
  }
}
