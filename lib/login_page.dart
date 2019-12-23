import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlutterLogo(size: 150),
              SizedBox(height: 50),
              _signInButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _signInButton() {
    //在flutter的控件裡常用按鈕有：FlatButton,RaisedButton，FloatingActionButton,OutlineButton
    //FlatButton是扁平的，沒有陰影的。
    //RaisedButton是有陰影，看起來凸起來的。
    //FloatingActionButton是在側面浮起來的那種按鈕。
    //OutlineButton ，帶邊框的按鈕中文叫線框按鈕。
    return OutlineButton();
  }
}
