import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_medical_beauty/page/home/navigation.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          NavigationPage()
        ],
      )
    );
  }
}
