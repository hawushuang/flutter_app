import 'package:flutter/material.dart';
import 'newJumpPage.dart';

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
          RaisedButton(
            child: Text("跳转"),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                return JumpPage();
              }));
            },
          )
        ],
      ),
    );
  }
}
