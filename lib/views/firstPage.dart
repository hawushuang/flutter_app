import 'package:flutter/material.dart';
import '../widgets/BannerView.dart';

class FirstPage extends StatefulWidget {
  @override
  createState() => FirstPageState();
}

class FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("111111"),
        ],
      ),
    );
  }
}
