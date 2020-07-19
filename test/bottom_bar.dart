import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  return runApp(new MainPage());
}

class MainPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return new MaterialApp(title: 'test', home: new MainPageWidget());
  }
}

class MainPageWidget extends StatefulWidget {
  State<StatefulWidget> createState() {
    return new MainPageState();
  }
}

class MainPageState extends State<MainPageWidget> {
  int _index = 0;
  final bottomBarList = [
    new Home(),
    new News(),
    new Self(),
  ];
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: bottomBarList[_index],
      ),
      body: bottomBarList[_index],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home), title: new Text('首页')),
          BottomNavigationBarItem(
              icon: Icon(Icons.new_releases), title: new Text('新闻')),
          BottomNavigationBarItem(
              icon: Icon(Icons.my_location), title: new Text('我的')),
        ],
        currentIndex: _index,
        fixedColor: Color.fromRGBO(222, 111, 111, .9),
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
      ),
    );
  }
}

class Home extends StatelessWidget {
  Widget build(BuildContext context) {
    return new Text('Home');
  }
}

class News extends StatelessWidget {
  Widget build(BuildContext context) {
    return new Text('News');
  }
}

class Self extends StatelessWidget {
  Widget build(BuildContext context) {
    return new Text('Self');
  }
}
