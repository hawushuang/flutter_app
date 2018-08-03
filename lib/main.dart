import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './views/firstPage.dart';
import './views/secondPage.dart';
import './views/thirdPage.dart';
import './views/fourthPage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  createState() => MainWidget();
}

class MainWidget extends State<MyApp> {
  int _tabIndex = 0;
  final tabTextStyleNormal = new TextStyle(color: const Color(0xff969696));
  final tabTextStyleSelected = new TextStyle(color: const Color(0xff63ca6c));

  // 页面底部TabItem上的图标数组
  var tabImages;
  var appBarTitles = ['资讯', '动弹', '发现', '我的'];

  @override
  Widget build(BuildContext context) {
    initData();
    var _body = new IndexedStack(
      index: _tabIndex,
      children: <Widget>[FirstPage(), SecondPage(), ThirdPage(), FourthPage()],
    );
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(appBarTitles[_tabIndex]),
          centerTitle: true,
        ),
        body: _body,
        bottomNavigationBar: CupertinoTabBar(
          currentIndex: _tabIndex,
          items: getBottomNavItems(),
          onTap: (index) {
            setState(() {
              _tabIndex = index;
            });
          },
        ),
        drawer: Drawer(
          child: Center(
            child: Text("侧滑"),
          ),
        ),
      ),
    );
  }

  List<BottomNavigationBarItem> getBottomNavItems() {
    List<BottomNavigationBarItem> list = List();
    for (int i = 0; i < 4; i++) {
      list.add(new BottomNavigationBarItem(
          icon: getTabIcon(i), title: getTabTitle(i)));
    }
    return list;
  }

  // 根据索引值确定Tab是选中状态的样式还是非选中状态的样式
  TextStyle getTabTextStyle(int curIndex) {
    if (curIndex == _tabIndex) {
      return tabTextStyleSelected;
    }
    return tabTextStyleNormal;
  }

// 根据索引值确定TabItem的icon是选中还是非选中
  Image getTabIcon(int curIndex) {
    if (curIndex == _tabIndex) {
      return tabImages[curIndex][1];
    }
    return tabImages[curIndex][0];
  }

// 根据索引值返回页面顶部标题
  Text getTabTitle(int curIndex) {
    return Text(appBarTitles[curIndex], style: getTabTextStyle(curIndex));
  }

  // 数据初始化，包括TabIcon数据和页面内容数据
  void initData() {
    if (tabImages == null) {
      tabImages = [
        [
          getTabImage('images/ic_nav_news_normal.png'),
          getTabImage('images/ic_nav_news_actived.png')
        ],
        [
          getTabImage('images/ic_nav_tweet_normal.png'),
          getTabImage('images/ic_nav_tweet_actived.png')
        ],
        [
          getTabImage('images/ic_nav_discover_normal.png'),
          getTabImage('images/ic_nav_discover_actived.png')
        ],
        [
          getTabImage('images/ic_nav_my_normal.png'),
          getTabImage('images/ic_nav_my_pressed.png')
        ]
      ];
    }
  }

// 传入图片路径，返回一个Image组件
  Image getTabImage(path) {
    return Image.asset(path, width: 20.0, height: 20.0);
  }
}
