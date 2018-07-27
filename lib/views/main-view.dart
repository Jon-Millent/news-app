import 'package:flutter/material.dart';

import './tabs/home.dart';
import './tabs/myself.dart';
import './tabs/top.dart';
import './tabs/video.dart';

class MainView extends StatefulWidget {
  @override
  State createState() => new MainViewState();
}


class MainViewState extends State<MainView> with SingleTickerProviderStateMixin {

  int nowTabIndex = 0;
  int homePageMessageCount = 3;
  List<StatefulWidget> _pageList;
  StatefulWidget _currentPage;

  @override
  void initState(){
    super.initState();

    _pageList = <StatefulWidget>[
      new TablesHome(),
      new TablesVideo(),
      new TablesTop(),
      new TablesMySelf()
    ];

    setState(() {
      _currentPage = _pageList[nowTabIndex];
      print(_currentPage);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }



  Widget getTab(String tabName, IconData icon, int count, int index){
    return Expanded(
      flex: 1,
      child: new FlatButton(

        onPressed: (){
          setState(() {
            nowTabIndex = index;
            _currentPage = _pageList[nowTabIndex];
          });
        },

        child: new Container(
          padding: EdgeInsets.only(top: 6.0, bottom: 6.0),
          child: new Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              new Align(
                child: new Column(
                  children: <Widget>[
                    new Container(
                      child: new Icon(
                        icon,
                        size: 24.0,
                        color: nowTabIndex == index ? Colors.red : Colors.black,
                      ),
                    ),
                    new Container(
                      child: new Text(
                        tabName,
                        textAlign: TextAlign.center,
                        style: new TextStyle(
                          color: nowTabIndex == index ? Colors.red : Colors.black,
                        )
                      ),
                    )
                  ],
                ),
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

                right: 13.0,
                top: 2.0,
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build



    return new Scaffold(
      body: new Center(
        child: _currentPage
      ),
      bottomNavigationBar: new Material(
        color: Color.fromRGBO(244, 245, 246, 1.0),
        child: new Container(
          height: 60.0,
          decoration: const BoxDecoration(
            border: const Border(
              top: const BorderSide(width: 1.0, color: const Color.fromRGBO(232, 232, 232, 1.0)),
            ),
          ),
          child: new Row(
            children: <Widget>[
              getTab('首页', Icons.home, homePageMessageCount, 0),
              getTab('小视频', Icons.ondemand_video, 0, 1),
              getTab('微头条', Icons.chat_bubble, 0, 2),
              getTab('未登录', Icons.person, 0, 3),
            ],
          ),
        ),
      ),
    );
  }
}