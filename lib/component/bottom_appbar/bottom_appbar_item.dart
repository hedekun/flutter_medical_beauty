import 'package:flutter/material.dart';
import 'package:flutter_medical_beauty/common/style/fontsize.dart';

// 自定义bottomAppBar
class BottomAppBarItem extends StatefulWidget {
  const BottomAppBarItem({Key key, @required this.index, @required this.currentIndex, @required this.onChanged, this.iconName, this.title}) : super(key: key);
  final int index;
  final int currentIndex;
  final ValueChanged<int> onChanged;
  final String iconName;
  final String title;

  @override
  _BottomAppBarItemState createState() => _BottomAppBarItemState();
}

class _BottomAppBarItemState extends State<BottomAppBarItem> {
  String _url;

  @override
  Widget build(BuildContext context) {
    _url = widget.currentIndex == widget.index ? 'assets/images/home/${widget.iconName}_active.jpg' : 'assets/images/home/${widget.iconName}.jpg';
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.onChanged(widget.index);
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // 切换的时候过渡效果
          AnimatedSwitcher(
              duration: const Duration(milliseconds: 100),
              transitionBuilder: (Widget child, Animation<double> animation) {
                //执行缩放动画
                return ScaleTransition(child: child, scale: animation);
              },
              child: Padding(
                key: ValueKey('${widget.index}$_url'),
                padding: EdgeInsets.only(top: 2),
                child: Image(
                  image: AssetImage(_url),
                  width: 24,
                  height: 24,
                  fit: BoxFit.cover,
                ),
              )
          ),
          widget.currentIndex == widget.index ? Text(widget.title, style: TextStyle(fontSize: FontSize.small_size, color: Theme.of(context).primaryColor)) : Text(widget.title, style: TextStyle(fontSize: FontSize.small_size))
        ],
      ),
    );
  }
}
