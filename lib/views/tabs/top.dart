import 'package:flutter/material.dart';

// 头条

class TablesTop extends StatefulWidget {
  @override
  TablesTopState createState() => new TablesTopState();
}

class TablesTopState extends State<TablesTop>  {


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(title: new Text('头条'),),
      body: new Text('头条'),
    );
  }
}