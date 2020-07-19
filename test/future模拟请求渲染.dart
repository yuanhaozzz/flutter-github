import 'package:flutter/material.dart';

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
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('init'),
      ),
      body: new Center(
        child: new FutureBuilder(
            future: mockNetworkData(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              // 请求完成
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return new Text('error');
                } else {
                  return new Text('success');
                }
              } else {
                return CircularProgressIndicator();
              }
            }),
      ),
    );
  }
}

Future<String> mockNetworkData() async {
  return Future.delayed(Duration(seconds: 2), () {
    print('我是网络数据模拟');
  });
}
