import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';

class TablesMySelf extends StatefulWidget {
  @override
  MySelfState createState() => new MySelfState();
}

class MySelfState extends State<TablesMySelf> {
  final String _url = 'http://v.juhe.cn/toutiao/index?';
  List data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    debugPrint('初始化！！！！！！！！！！！');
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(title: new Text('我的'),),
      body: new Text('sadasdsadsad'),
    );
  }

  onShow(){
    debugPrint('onshow');
  }
}