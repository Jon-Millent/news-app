import 'package:flutter/material.dart';

// 视频

class TablesVideo extends StatefulWidget {
  @override
  TablesVideoState createState() => new TablesVideoState();
}

class TablesVideoState extends State<TablesVideo> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(title: new Text('视频'),),
      body: new Text('视频'),
    );
  }
}