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
      body: new Center(),
    );
  }
}
