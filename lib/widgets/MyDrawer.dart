import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  // 菜单文本前面的图标大小
  static const double IMAGE_ICON_WIDTH = 30.0;

  // 菜单后面的箭头的图标大小
  static const double ARROW_ICON_WIDTH = 30.0;

  // 菜单后面的箭头图片
  final rightArrowIcon = Icon(
    Icons.keyboard_arrow_right,
    size: ARROW_ICON_WIDTH,
  );

//  final rightArrowIcon = new Image.asset(
//    'images/ic_arrow_right.png',
//    width: ARROW_ICON_WIDTH,
//    height: ARROW_ICON_WIDTH,
//  );

  // 菜单的文本
  final menuTitles = ['发布动弹', '动弹小黑屋', '关于', '设置'];

  // 菜单文本前面的图标
  final menuIcons = [
    './images/leftmenu/ic_fabu.png',
    './images/leftmenu/ic_xiaoheiwu.png',
    './images/leftmenu/ic_about.png',
    './images/leftmenu/ic_settings.png'
  ];

  // 菜单文本的样式
  final menuStyle = new TextStyle(
    fontSize: 15.0,
  );

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints.expand(width: 304.0),
      child: Material(
        //阴影默认16，自带阴影
        elevation: 16.0,
        child: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: ListView.builder(
              itemCount: menuTitles.length * 2 + 1, itemBuilder: renderRow),
        ),
      ),
    );
  }

  Widget renderRow(BuildContext context, int index) {
    if (index == 0) {
      var img = new Image.asset(
        'images/cover_img.jpg',
        width: 304.0,
        height: 304.0,
      );
      return new Container(
        width: 304.0,
        height: 304.0,
//        margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
        child: img,
      );
    }
    index -= 1;
    // 奇数则渲染分割线
    if (index.isOdd) {
      return Divider();
    }
    // 偶数，就除2取整，然后渲染菜单item
    index = index ~/ 2;
    // 菜单item组件
    var listItemContent = new Padding(
      // 设置item的外边距
      padding: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
      // Row组件构成item的一行
      child: new Row(
        children: <Widget>[
          // 菜单item的图标
          getIconImage(menuIcons[index]),
          // 菜单item的文本
          new Expanded(
              child: new Text(
            menuTitles[index],
            style: menuStyle,
          )),
          rightArrowIcon
        ],
      ),
    );
    //点击事件
    return InkWell(
      child: listItemContent,
      onTap: () {
        print("click list item $index");
      },
    );
  }

  Widget getIconImage(path) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(2.0, 0.0, 6.0, 0.0),
      child: Image.asset(path, width: 28.0, height: 28.0),
    );
  }
}
