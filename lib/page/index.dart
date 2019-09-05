import 'package:flutter/material.dart';
import 'package:flutter_medical_beauty/common/style/colours.dart';
import 'package:flutter_medical_beauty/component/bottom_appbar/bottom_appbar_item.dart';
import 'package:flutter_medical_beauty/component/bottom_appbar/bottom_appbar_publish.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_medical_beauty/page/home/index.dart';
import 'package:flutter_medical_beauty/page/discover/index.dart';
import 'package:flutter_medical_beauty/page/shop/index.dart';
import 'package:flutter_medical_beauty/page/mine/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  int _currentIndex = 0;
  DateTime _lastTime;
  final _pageController = PageController();
  List<Widget> _pageList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageList = [HomePage(), DiscoverPage(), ShopPage(), MinePage()];
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 375, height: 812)..init(context);
    return WillPopScope(
      onWillPop: _isExit,
      child: Scaffold(
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          children: _pageList,
          controller: _pageController,
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colours.white_color,
          elevation: 5,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              BottomAppBarItem(
                index: 0,
                currentIndex: _currentIndex,
                onChanged: _currentIndexChanged,
                iconName: 'home',
                title: '主页',
              ),
              BottomAppBarItem(
                  index: 1,
                  currentIndex: _currentIndex,
                  onChanged: _currentIndexChanged,
                  iconName: 'discover',
                  title: '发现'),
              BottomAppBarPublish(),
              BottomAppBarItem(
                index: 2,
                currentIndex: _currentIndex,
                onChanged: _currentIndexChanged,
                iconName: 'shop',
                title: '商城',
              ),
              BottomAppBarItem(
                index: 3,
                currentIndex: _currentIndex,
                onChanged: _currentIndexChanged,
                iconName: 'mine',
                title: '我的',
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _currentIndexChanged(int index) {
    setState(() {
      _currentIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  Future<bool> _isExit() {
    if (_lastTime == null ||
        DateTime.now().difference(_lastTime) > Duration(milliseconds: 3000)) {
      _lastTime = DateTime.now();
      Fluttertoast.showToast(
          msg: "再次点击退出应用", gravity: ToastGravity.CENTER, fontSize: 16.0);
      return Future.value(false);
    }
    Fluttertoast.cancel();
    return Future.value(true);
  }
}
