import 'package:flutter/material.dart';
import '../util/loli.dart';

import './tabs/home.dart';
import './tabs/myself.dart';
import './tabs/top.dart';
import './tabs/video.dart';

class MainView extends StatefulWidget {
  @override
  State createState() => new MainViewState();
}


class MainViewState extends State<MainView> {

  TabController controller;
  int nowTabIndex = 0;
  int homePageMessageCount = 3;

  @override
  void initState(){
    super.initState();
  }

  Widget getTab(String tabName, IconData icon, int count){


    return new Container(
      height: 50.0,
      padding: EdgeInsets.only(top: 6.0, bottom: 6.0),
      child: new Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          new Column(
            children: <Widget>[
              new Container(
                child: new Icon(
                  icon,
                  size: 24.0,
                ),
              ),

              new Container(
                child: new Text(
                  tabName
                ),
              )
            ],
          ),
          new Positioned(
            child: new AnimatedOpacity(
              opacity: count > 0 ? 1.0 : 0.0,
              duration: Duration(milliseconds: 500),
              child: Container(
                child: new Center(
                  child: new Text(
                    count.toString(),
                    style: new TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1.0),
                      fontSize: 15.0,
                    ),
                  ),
                ),
                width: 22.0,
                height: 22.0,
                decoration: new BoxDecoration(
                  color: Color.fromRGBO(248, 89, 89, 1.0),
                  borderRadius: new BorderRadius.all(Radius.circular(11.0)),
                  border: new Border.all(
                    width: 2.0,
                    color: Colors.white
                  ),

                ),

              ),
            ),

            right: -13.0,
            top: -2.0,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new Scaffold(
      body: new IndexedStack(
        index: nowTabIndex,
        children: <Widget>[
          new TablesHome(),
          new TablesVideo(),
          new TablesTop(),
          new TablesMySelf()
        ],
      ),
    );
  }
}