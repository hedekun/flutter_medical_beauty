import 'package:flutter/material.dart' show BuildContext;
import 'package:provider/provider.dart';

class Store {

  static BuildContext context;
  static BuildContext widgetCtx;
  //  我们将会在main.dart中runAPP实例化init
  static init({ context, child }) {
    return MultiProvider(
      providers: [
      ],
      child: child,
    );
  }

  //  通过Provider.value<T>(context)获取状态数据
  static T value<T>(context) {
    return Provider.of(context);
  }

  //  通过Consumer获取状态数据
  static Consumer connect<T>({builder, child}) {
    return Consumer<T>(builder: builder, child: child);
  }
}
