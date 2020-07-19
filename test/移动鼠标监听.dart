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
  double _pressed = 0;
  double _moveX = 0.0;
  double _moveY = 0.0;
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('init'),
      ),
      body: new Center(
          child: new Column(
        children: <Widget>[
          new Container(
            width: 400,
            height: 400,
            decoration: new BoxDecoration(
                border: Border.all(width: 2, color: Colors.orange)),
            child: new Stack(
              children: <Widget>[
                new Positioned(
                    top: _moveY,
                    left: _moveX,
                    child: new GestureDetector(
                      onPanDown: (DragDownDetails e) {
                        print(e.globalPosition);
                      },
                      onPanUpdate: (DragUpdateDetails e) {
                        setState(() {
                          _moveX += e.delta.dx;
                          _moveY += e.delta.dy;
                        });
                      },
                      onPanEnd: (DragEndDetails e) {
                        print(e.velocity);
                      },
                      child: new Container(
                        width: 30,
                        height: 30,
                        margin: EdgeInsets.only(bottom: 50),
                        color: Colors.purple,
                      ),
                    ))
              ],
            ),
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              new Text(
                '按下' '$_pressed',
              ),
              new Text('移动X' '$_moveX'),
              new Text('移动Y' '$_moveY')
            ],
          )
        ],
      )),
    );
  }
}
