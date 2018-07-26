import 'package:flutter/material.dart';
import 'dart:async';
import 'package:dio/dio.dart';
import '../../util/api.dart';
import "package:pull_to_refresh/pull_to_refresh.dart";
import 'dart:convert';

// 主页

class TablesHome extends StatefulWidget {
  @override
  TablesHomeState createState() => new TablesHomeState();
}

class TablesHomeState extends State<TablesHome> with SingleTickerProviderStateMixin{


  TabController _tabController;

  final List<NewsTab> myTabs = <NewsTab>[
    new NewsTab('头条', 'toutiao'),
    new NewsTab('社会', 'shehui'),
    new NewsTab('国内', 'guonei'),
    new NewsTab('国际', 'guoji'),
    new NewsTab('娱乐', 'yule'),
    new NewsTab('体育', 'tiyu'),
    new NewsTab('军事', 'junshi'),
    new NewsTab('科技', 'keji'),
    new NewsTab('财经', 'caijing'),
    new NewsTab('时尚', 'shishang'),
  ];


  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }


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
                  margin: EdgeInsets.only(left: 12.0, top: 8.0),
                ),
              ),
            ],
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(36.0),
          child: new Container(
            child: new Stack(
              children: <Widget>[
                new TabBar(
                  labelStyle: new TextStyle(
                  ),
                  indicatorColor: Colors.white,
                  unselectedLabelColor: Color.fromRGBO(34, 34, 34, 1.0),
                  labelColor: Color.fromRGBO(248, 89, 89, 1.0),
                  controller: _tabController,
                  tabs: myTabs.map((item){
                    return new Tab(text: item.newsName);
                  }).toList(),
                  isScrollable: true,
                )
              ],
            ),
            decoration: new BoxDecoration(
              color: Colors.white
            ),
            width: MediaQuery.of(context).size.width,
            height: 36.0,
          ),
        )
      ),
      body: new TabBarView(
        controller: _tabController,
        children: myTabs.map((item) {
          return item.newsController;
        }).toList(),
      ),
    );
  }
}


class NewsTab {
  String newsName;
  String newsType;
  NewsTabsController newsController;

  NewsTab(String newsName, String newsType){
    this.newsName = newsName;
    this.newsType = newsType;
    this.newsController = new NewsTabsController(newsType);
  }
}

class NewsTabsController extends StatefulWidget {
  String newsType;    //新闻类型

  NewsTabsController (String newsType){
    this.newsType = newsType;
  }

  State createState() => new NewsTabsControllerState(newsType);
}

class NewsTabsControllerState extends State<NewsTabsController> with AutomaticKeepAliveClientMixin  {
  String newsType;
  RefreshController _refreshController;
  Api $api = new Api();


  List itemArray = [
    1,2,3,4,5,6,7,8,9,2,2,2,22,2,2,
    1,2,3,4,5,6,7,8,9,2,2,2,22,2,2,
    1,2,3,4,5,6,7,8,9,2,2,2,22,2,2,
    1,2,3,4,5,6,7,8,9,2,2,2,22,2,2,
    1,2,3,4,5,6,7,8,9,2,2,2,22,2,2,
  ];


  NewsTabsControllerState(String newsType){
    this.newsType = newsType;
  }


  @override
  bool get wantKeepAlive => true;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('initState');
    this.getNewsData();


    _refreshController = new RefreshController();
  }

  @override
  void didChangeDependencies() {
    print('didChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(oldWidget) {
    print('didUpdateWidget');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    print('deactivate');
    super.deactivate();
  }


  getNewsData() async{
    Response response =  await this.$api.getNews(newsType);
    print('asdasdsad');
    print(response);
  }


  Widget _buildHeader(context,mode){
    return new ClassicIndicator(mode: mode);
  }


  Widget _buildFooter(context, mode){
    // the same with header
    return new ClassicIndicator(mode: mode);
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        controller: _refreshController,
        onRefresh: _onRefresh,
        headerBuilder: _buildHeader,
        footerBuilder: _buildFooter,
        child: new ListView.builder(
          itemCount: this.itemArray.length,
          itemBuilder: (context, i) {
            return renderNewsController(this.itemArray[i]);
          },
        )
    );
  }

  void _onRefresh(bool up){
    if(up){
      debugPrint('up');
      //headerIndicator callback
      new Future.delayed(const Duration(milliseconds: 2009))
          .then((val) {

        _refreshController.sendBack(up, RefreshStatus.completed);
      });

    }
    else{
      //footerIndicator Callback
      debugPrint('else');
      _refreshController.sendBack(up, RefreshStatus.completed);
    }
  }

  void _onOffsetCallback(bool isUp, double offset) {
    // if you want change some widgets state ,you should rewrite the callback
  }

  Widget renderNewsController(newsInfo){
    return new Text('sadasd');
  }

}