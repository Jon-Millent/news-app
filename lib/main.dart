import 'package:flutter/material.dart';
import './views/main-view.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primaryColor: Color.fromRGBO(212, 61, 61, 1.0),
      ),
      home: new MainView()
    );
  }
}