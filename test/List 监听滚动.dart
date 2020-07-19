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
    return new HomeWidget();
  }
}

class HomeWidget extends StatefulWidget {
  @override
  _HomeStatefulWidget createState() => new _HomeStatefulWidget();
}

class _HomeStatefulWidget extends State<HomeWidget> {
  ScrollController _controller = new ScrollController();
  bool showButton = false;
  @override
  void initState() {
    super.initState();

    print('object 22');
    _controller.addListener(() {
      print(_controller.offset);
      if (_controller.offset > 1000) {
        setState(() {
          showButton = true;
        });
      } else {
        setState(() {
          showButton = false;
        });
      }
    });
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('init'),
      ),
      body: new Center(
        child: Scrollbar(
          child: ListView.builder(
              itemCount: 1000,
              itemExtent: 50,
              controller: _controller,
              itemBuilder: (context, index) {
                return new Text('$index' '哈哈哈');
              }),
        ),
      ),
      floatingActionButton: showButton
          ? FloatingActionButton(
              child: Icon(Icons.arrow_upward),
              onPressed: () {
                _controller.animateTo(.0,
                    duration: Duration(milliseconds: 200), curve: Curves.ease);
              })
          : null,
    );
  }
}
