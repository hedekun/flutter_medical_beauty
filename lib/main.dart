import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/services.dart';
import 'package:flutter_medical_beauty/router/application.dart';
import 'package:flutter_medical_beauty/router/routers.dart';
import 'package:flutter_medical_beauty/common/style/colours.dart';
import 'package:flutter_medical_beauty/common/style/fontsize.dart';



void main() {
  // 实例化路由
  Router router = Router();
  Routes.configureRoutes(router);
  Application.router = router;

  runApp(MyApp());
  SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor:Colors.white, statusBarBrightness: Brightness.dark, statusBarIconBrightness: Brightness.dark);
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '肛豆医美',
      onGenerateRoute: Application.router.generator,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colours.app_main,
        backgroundColor: Colours.white_color,
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colours.white_color,
        textTheme: TextTheme(
          //设置Material的默认字体样式
          body1: TextStyle(color: Colours.text_color, fontSize: FontSize.middle_size),
        ),
        iconTheme: IconThemeData(
          color: Colours.text_color,
          size: FontSize.middle_size,
        ),
      ),
    );
  }
}

