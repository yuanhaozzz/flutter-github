import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../http/api.dart';

const _themes = <MaterialColor>[
  Colors.green,
  Colors.pink,
  Colors.purple,
  Colors.pink,
  Colors.yellow
];

/// 全局方法
class Global {
  // 域名
  static String domain = 'https://api.github.com';
  // 接口
  // ignore: unused_field
  static Http http = new Http();
  // 本地存储容器
  static SharedPreferences _prefs;
  // 存储信息
  static Map profile = {};
  // 用户信息
  static Map userinfo;
  // 主题
  static List<MaterialColor> themes = _themes;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
    print(_prefs);
    var _profile = _prefs.getString('profile');
    if (_profile != null) {
      try {
        profile = json.decode(_profile);
      } catch (e) {}
    }
  }

  /// 存储用户信息
  static void saveProfile() {
    _prefs.setString('profile', json.encode(profile));
  }
}
