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
      appBar: new AppBar(
        title: new Container(
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Flexible(
                child: new Stack(
                  children: <Widget>[
                    new Container(
                      child: new TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '搜你想搜的',
                          contentPadding: const EdgeInsets.only(left: 30.0, top: 10.0, bottom: 10.0, right: 10.0),
                        ),
                        style: new TextStyle(
                            height: 0.8,
                            color: Color.fromRGBO(34, 34, 34, 1.0)
                        ),
                      ),
                      decoration: new BoxDecoration(
                        color: Colors.white,
                        borderRadius: new BorderRadius.all(new Radius.circular(6.0)),
                      )
                    ),
                    new Positioned(
                      child: new Container(
                        child: new Center(
                          child: new Icon(
                            Icons.search,
                            color: Color.fromRGBO(34, 34, 34, 0.7),
                          ),
                        ),
                        width: 30.0,
                        height: 38.0,
                      ),
                      left: 0.0,
                      top: 0.0,
                    )
                  ],
                ),
              ),
              new GestureDetector(
                child: new Container(
                  child: new Column(
                    children: <Widget>[
                      new Icon(
                        Icons.camera,
                        size: 20.0,
                      ),
                      new Text(
                        '发布',
                        style: TextStyle(
                          fontSize: 14.0
                        ),
                      )
                    ],
                  ),
                  width: 40.0,
                  margin: EdgeInsets.only(left: 16.0, top: 8.0),
                ),
              ),
            ],
          ),
        ),
      ),
      body: new Text('主页'),
    );
  }
}