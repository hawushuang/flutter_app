import 'package:flutter/material.dart';

class BannerView extends StatefulWidget {
  var data;

  BannerView(data) {
    this.data = data;
  }

  @override
  createState() => BannerState(data);
}

class BannerState extends State<BannerView>
    with SingleTickerProviderStateMixin {
  // TabController为TabBarView组件的控制器
  TabController tabController;
  List slideData;

  BannerState(data) {
    slideData = data;
  }

  // 初始化控制器
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(
        length: slideData == null ? 0 : slideData.length, vsync: this);
  }

  @override
  void dispose() {
    // 销毁
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items;
    if (slideData != null && slideData.length > 0) {
      for (var item in slideData) {
        var title = item['title'];
        var imgUrl = item['imagePath'];
        var detailUrl = item['url'];
        items.add(GestureDetector(
          onTap: () {
            // 点击页面跳转到详情
          },
          child: Stack(
            children: <Widget>[
              // 加载网络图片
              Image.network(imgUrl),
              Container(
                // 标题容器宽度跟屏幕宽度一致
                width: MediaQuery.of(context).size.width,
                // 背景为黑色，加入透明度
                color: const Color(0x50000000),
                // 标题文本加入内边距
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Align(
                    child: Text(title),
                    alignment: Alignment.bottomLeft,
                  ),
                ),
              )
            ],
          ),
        ));
      }
    }
    return TabBarView(
      children: items,
      controller: tabController,
    );
  }
}
