import 'dart:convert';

import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';

import 'router_handler.dart';

class Routes {
  static String home = '/login';
  static String login = '/';
  static String theme = '/theme';

  Routes.configureRoutes(Router router) {
    print('json.encode(router)');
    router.define('/', handler: homeHandler);
    router.define('/login', handler: loginHandler);
    router.define('/theme', handler: themeHandler);
  }
}
