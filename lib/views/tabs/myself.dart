import 'package:flutter/material.dart';

class TablesMySelf extends StatefulWidget {
  @override
  MySelfState createState() => new MySelfState();
}

class MySelfState extends State<TablesMySelf> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(title: new Text('我的'),),
      body: new Text('我的'),
    );
  }
}