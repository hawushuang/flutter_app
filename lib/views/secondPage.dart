import 'package:flutter/material.dart';
import 'newJumpPage.dart';

class SecondPage extends StatefulWidget {
  @override
  createState() => SecondPageState();
}

class SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("2222222"),
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
