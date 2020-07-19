import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  return runApp(new MainInit());
}

class MainInit extends StatelessWidget {
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '选项卡',
      home: new DefaultTabControllerComponent(),
    );
  }
}

class DefaultTabControllerComponent extends StatelessWidget {
  final List<Tab> myTabs = <Tab>[
    Tab(
      text: '选项卡1',
    ),
    Tab(
      text: '选项卡2',
    ),
  ];
  Widget build(BuildContext context) {
    return new DefaultTabController(
        length: myTabs.length,
        child: Scaffold(
            appBar: new AppBar(
              title: new Text('tab bar'),
              bottom: new TabBar(
                tabs: myTabs,
                isScrollable: true,
              ),
            ),
            body: TabBarView(
                children: myTabs.map((Tab tab) {
              return Center(
                child: new Text(tab.text),
              );
            }).toList())));
  }
}
