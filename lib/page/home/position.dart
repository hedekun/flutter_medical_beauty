import 'package:flutter/material.dart';
import 'package:flutter_medical_beauty/common/util/image_util.dart';


class PositionPage extends StatelessWidget {
  final List<int> list = [1, 2, 3];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: list.map((item) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
          child: loadAssetImage('position/$item'),
        );
      }).toList(),
    );
  }
}

