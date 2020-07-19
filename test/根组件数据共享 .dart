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
  int _count = 4;

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('init'),
      ),
      body: new Center(
        child: new ShareDataWidget(
          data: _count,
          child: new Container(
            child: Row(
              children: <Widget>[
                new TestCount1(),
                new TestCount2(),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            _count += 1;
          });
        },
      ),
    );
  }
}

class ShareDataWidget extends InheritedWidget {
  ShareDataWidget({@required this.data, Widget child}) : super(child: child);
  final int data;

  //定义一个便捷方法，方便子树中的widget获取共享数据
  static ShareDataWidget getData(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ShareDataWidget>();
  }

  //该回调决定当data发生变化时，是否通知子树中依赖data的Widget
  @override
  bool updateShouldNotify(ShareDataWidget old) {
    //如果返回true，则子树中依赖(build函数中有调用)本widget
    //的子widget的`state.didChangeDependencies`会被调用
    return old.data != data;
  }
}

class TestCount2 extends StatelessWidget {
  Widget build(BuildContext context) {
    return new Text(ShareDataWidget.getData(context).data.toString());
  }
}

class TestCount1 extends StatelessWidget {
  Widget build(BuildContext context) {
    return new Text(ShareDataWidget.getData(context).data.toString());
  }
}
