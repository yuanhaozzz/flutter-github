import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  return runApp(new MainInit());
}

class MainInit extends StatelessWidget {
  Widget build(BuildContext context) {
    return new MaterialApp(title: 'init', home: new MainPageWidget());
  }
}

class MainPageWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    final _controller = TextEditingController();

    void saveInfo() async {
      // 获取本地存储实例
      SharedPreferences pres = await SharedPreferences.getInstance();
      print(pres.setString('user', _controller.text));
    }

    void getInfo() async {
      SharedPreferences pres = await SharedPreferences.getInstance();
      print(pres.getString('user'));
    }

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('init'),
      ),
      body: new Center(
        child: Column(
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                  labelText: "用户名",
                  hintText: "用户名或邮箱",
                  prefixIcon: Icon(Icons.person)),
            ),
            RaisedButton(
              onPressed: () {
                saveInfo();
              },
              child: Text('保存'),
            ),
            RaisedButton(
              onPressed: () {
                getInfo();
              },
              child: Text('获取'),
            ),
          ],
        ),
      ),
    );
  }
}
