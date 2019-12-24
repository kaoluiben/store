import 'package:flutter/material.dart';
import 'package:store/first_screen.dart';
import 'sign_in.dart';

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
    return OutlineButton(
      splashColor: Colors.grey, //點擊按鈕時水波紋的顏色
      onPressed: () {
        signInWithGoogle().whenComplete(() {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return FirstScreen();
          }));
        });
      },
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40)), //設置按鈕的形狀，半圓角的矩形邊，
      highlightElevation: 0, //陰影的範圍，值越大陰影範圍越大
      borderSide: BorderSide(color: Colors.grey), //邊框顏色
      //給子節點設置內邊距屬性
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage("assets/google_logo.png"),
              height: 35.0,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  "Sign in with Google",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
