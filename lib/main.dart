import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'common/global.dart';

void main() {
  Global.init().then((value) => {
        runApp(ChangeNotifierProvider<Counter>.value(
          value: Counter(1), //2
          child: MainInit(),
        ))
      });
}

class MainInit extends StatelessWidget {
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'github',
      home: new MainPageWidget(),
      routes: <String, WidgetBuilder>{
        '/first_page': (context) => new FirstPage(),
        '/second_page': (context) => new SecondPage(),
      },
    );
  }
}

class MainPageWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return new Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<Counter>(context, listen: false).add();
        },
        child: Icon(Icons.add),
      ),
      appBar: new AppBar(
        title: new Text('${Provider.of<Counter>(context).count}'),
      ),
      body: new Center(
        child: Column(
          children: <Widget>[
            Text('${Provider.of<Counter>(context).count}'),
            RaisedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/first_page');
                },
                child: Text('跳转')),
          ],
        ),
      ),
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<Counter>(context, listen: false).add();
        },
        child: Icon(Icons.add),
      ),
      appBar: new AppBar(
        title: Text('${Provider.of<Counter>(context).count}'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("${Provider.of<Counter>(context).count}"),
          onPressed: () {
            Navigator.pushNamed(context, "/page2");
          },
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'SecondPage',
        home: new Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.add),
          ),
          appBar: new AppBar(
            title: Text('SecondPage'),
          ),
          body: RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/SecondPage');
              },
              child: Text('跳转')),
        ));
  }
}

class Counter with ChangeNotifier {
  //1
  int _count;
  Counter(this._count);

  void add() {
    _count++;
    print('object');
    notifyListeners(); //2
  }

  get count => _count; //3
}
