import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import './http.dart';

class Http extends CreateHttp {
  Http({Key key}) : super.init();

  final loginUrl = '/asd';

  // 登录
  Future login(String login, String pwd) async {
    String basic = 'Basic ' + base64.encode(utf8.encode('$login:$pwd'));
    // Options options = {
    //   'headers': {HttpHeaders.authorizationHeader: basic},
    //   'extra': {
    //     "noCache": true, //本接口禁用缓存
    //   }
    // } as Options;

    var r = await dio.get("/users/$login");
    return r.data;
    // return super.requestGet(loginUrl, queryParameters);
  }
}
