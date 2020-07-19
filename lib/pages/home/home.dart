// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:github_demo/states/globle_state.dart';
// import 'package:github_demo/states/globle_state.dart';
import 'package:provider/provider.dart';

import '../../routers/application.dart';
import './components/drawer.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('首页'),
        ),
        body: _buildBody(context),
        drawer: DrawerComponent());
  }

  _buildBody(BuildContext context) {
    final usermodel = Provider.of<UserModel>(context);
    // 判断是否登录
    if (!usermodel.isLogin) {
      return _notLogin(context);
    } else {
      return _logged();
    }
  }

  /// 未登录状态
  _notLogin(BuildContext context) {
    return Center(
      child: RaisedButton(
        child: Text('去登陆'),
        onPressed: () {
          Application.router.navigateTo(context, '/login');
        },
      ),
    );
  }

  /// 已登录
  _logged() {
    return Text('asd');
  }
}
