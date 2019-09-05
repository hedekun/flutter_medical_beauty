import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_medical_beauty/page/index.dart';

Handler welcomeHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return new IndexPage();
  },
);
