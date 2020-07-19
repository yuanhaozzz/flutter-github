import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_demo/routers/application.dart';
import 'package:provider/provider.dart';

import '../../../states/globle_state.dart';

class DrawerComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer2<UserModel, ThemeModel>(
      builder: (BuildContext context, UserModel user, ThemeModel theme,
          Widget child) {
        return Drawer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // 抽屉上部
              _drawerTop(theme, user),
              // 抽屉选项
              _drawerItem(context)
            ],
          ),
        );
      },
    );
  }

  /// 抽屉选项
  Widget _drawerItem(BuildContext context) {
    return Consumer2<UserModel, ThemeModel>(
        builder: (context, user, theme, child) {
      return ListView(
        shrinkWrap: true,
        children: <Widget>[
          ListTile(
              leading: Icon(Icons.color_lens),
              title: Text('换肤'),
              onTap: () => Application.router.navigateTo(context, '/theme')),
          if (user.isLogin)
            ListTile(
                leading: Icon(Icons.power_settings_new),
                title: Text('退出登录'),
                onTap: () => Application.router.navigateTo(context, '/theme'))
        ],
      );
    });
  }

  /// 抽屉上部
  Widget _drawerTop(ThemeModel theme, UserModel user) {
    return Container(
      height: 130,
      color: theme.theme,
      padding: EdgeInsets.only(left: 20, top: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          user.isLogin
              ? Container(
                  width: 80,
                  height: 80,
                  color: Colors.red,
                )
              : Image.asset(
                  'assets/images/not_login.png',
                  width: 70,
                ),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              '未登录',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
