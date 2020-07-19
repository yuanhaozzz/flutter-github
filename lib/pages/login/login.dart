import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../states/globle_state.dart';
import '../../common/global.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  GlobalKey _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer2<UserModel, ThemeModel>(
      builder: (context, user, theme, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('登录'),
          ),
          body: Padding(
            padding: EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: _username,
                    decoration: InputDecoration(
                        labelText: '用户名',
                        hintText: '用户名或邮箱',
                        icon: Icon(Icons.person)),
                    validator: (value) {
                      if (value.trim().isEmpty) {
                        return '用户名 不能为空';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _password,
                    decoration: InputDecoration(
                        labelText: '密码',
                        hintText: '您的登录密码',
                        icon: Icon(Icons.lock)),
                    validator: (value) {
                      if (value.length < 6) {
                        return '密码不能少于6位';
                      }
                      return null;
                    },
                  ),
                  RaisedButton(
                    child: Text('登录'),
                    color: theme.theme,
                    textColor: Colors.white,
                    onPressed: () {
                      if ((_formKey.currentState as FormState).validate()) {
                        //验证通过提交数据
                        Global.http
                            .login(_username.text, _password.text)
                            .then((value) {
                          print(value);
                          print('value================');
                        });
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
