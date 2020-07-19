import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';

import '../pages/home/home.dart';
import '../pages/login/login.dart';
import '../pages/theme/theme.dart';

var homeHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return Home();
});

var loginHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return Login();
});

var themeHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return Theme();
});
