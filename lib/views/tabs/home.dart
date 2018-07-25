import 'package:flutter/material.dart';

// 主页

class TablesHome extends StatefulWidget {
  @override
  TablesHomeState createState() => new TablesHomeState();
}

class TablesHomeState extends State<TablesHome> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(title: new Text('主页'),),
      body: new Text('主页'),
    );
  }
}