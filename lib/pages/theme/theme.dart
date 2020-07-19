import 'package:flutter/material.dart';
import 'package:github_demo/states/globle_state.dart';
import 'package:provider/provider.dart';
import '../../common/global.dart';

class Theme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('修改主题'),
        ),
        body: ListView(
          children: Global.themes.map<Widget>((e) {
            return GestureDetector(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  height: 40,
                  color: e,
                ),
              ),
              onTap: () {
                Provider.of<ThemeModel>(context).theme = e;
              },
            );
          }).toList(),
        ));
  }
}
