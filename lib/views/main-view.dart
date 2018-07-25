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


class MainViewState extends State<MainView> with SingleTickerProviderStateMixin {

  TabController controller;
  int nowTabIndex = 0;

  int homePageMessageCount = 3;

  @override
  void initState(){
    super.initState();
    this.controller = new TabController(length: 4, vsync: this);

  }

  @override
  void dispose() {
    // TODO: implement deactivate
    controller.dispose();
    super.dispose();
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
      body: new TabBarView(
        controller: this.controller,
        children: <Widget>[
          new TablesHome(),
          new TablesVideo(),
          new TablesTop(),
          new TablesMySelf()
        ],

      ),
      bottomNavigationBar: new Material(
        color: Color.fromRGBO(244, 245, 246, 1.0),
        child: new Container(
          decoration: const BoxDecoration(
            border: const Border(
              top: const BorderSide(width: 1.0, color: const Color.fromRGBO(232, 232, 232, 1.0)),
            ),
          ),
          child: new TabBar(
            labelColor: Color.fromRGBO(248, 89, 89, 1.0),
            unselectedLabelColor: Color.fromRGBO(80, 80, 80, 1.0),
            labelStyle: new TextStyle(
              fontSize: 10.0
            ),
            controller: this.controller,
            tabs: [
              getTab('首页', Icons.home, homePageMessageCount),
              getTab('小视频', Icons.ondemand_video, 0),
              getTab('微头条', Icons.chat_bubble, 0),
              getTab('未登录', Icons.person, 0),
            ],
            indicatorColor: Color.fromRGBO(248, 89, 89, 1.0),
            indicatorWeight: 0.1
          ),
        ),
      ),
    );
  }
}