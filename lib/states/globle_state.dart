import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_demo/common/global.dart';

class ProfileChangeNotifier extends ChangeNotifier {
  get _profile => Global.profile;

  @override
  void notifyListeners() {
    Global.saveProfile();
    super.notifyListeners();
  }
}

class UserModel extends ProfileChangeNotifier {
  get user => _profile['user'];

  // 是否登录
  bool get isLogin => user != null;

  set user(Map user) {
    _profile.user = user;
    notifyListeners();
  }
}

class ThemeModel extends ProfileChangeNotifier {
  // 获取当前主题，如果为设置主题，则默认使用蓝色主题
  ColorSwatch get theme => Global.themes.firstWhere((e) {
        return e.value == _profile['theme'];
      }, orElse: () => Colors.green);

  // 主题改变后，通知其依赖项，新主题会立即生效
  set theme(ColorSwatch color) {
    if (color != theme) {
      _profile['theme'] = color[500].value;
      notifyListeners();
    }
  }
}

class LocaleModel extends ProfileChangeNotifier {
  // 获取当前用户的APP语言配置Locale类，如果为null，则语言跟随系统语言
  Locale getLocale() {
    if (_profile['locale'] == null) return null;
    var t = _profile.locale.split("_");
    return Locale(t[0], t[1]);
  }

  // 获取当前Locale的字符串表示
  String get locale => _profile.locale;

  // 用户改变APP语言后，通知依赖项更新，新语言会立即生效
  set locale(String locale) {
    if (locale != _profile.locale) {
      _profile.locale = locale;
      notifyListeners();
    }
  }
}
