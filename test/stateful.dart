import 'package:flutter/material.dart';

void main() {
  return runApp(new MainInit());
}

class MainInit extends StatelessWidget {
  Widget build(BuildContext context) {
    return new MaterialApp(title: 'init', home: new HomeWidget());
  }
}

class HomeWidget extends StatefulWidget {
  @override
  _HomeStatefulWidget createState() => new _HomeStatefulWidget();
}

class _HomeStatefulWidget extends State<HomeWidget> {
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('init'),
      ),
      body: new Center(
        child: new Text('data'),
      ),
    );
  }
}
