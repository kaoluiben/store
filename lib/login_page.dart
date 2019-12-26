import 'package:flutter/material.dart';
import 'package:store/first_screen.dart';
import 'sign_in.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

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
              _phoneSignInButton(),
              SizedBox(height: 20),
              _googleSignInButton(),
            ],
          ),
        ),
      ),
    );
  }

  //Phone SignIn
  Widget _phoneSignInButton() {
    return Container(
      width: 250,
      decoration: BoxDecoration(
        // 邊界（`border`）屬性，要在背景顏色、漸變或圖像上方繪製的邊框。
        border: Border.all(
          width: 1.0,
          color: Colors.grey,
        ),
        // 邊界半徑（`borderRadius`）屬性，對此容器框的角進行舍入。
        borderRadius: const BorderRadius.all(
          // 半徑（`Radius`）類，圓形或橢圓形的半徑。
          // 邊界半徑.圓（`Radius.circular`）構造函數，構造一個圓形半徑。
          const Radius.circular(25.0),
        ),
      ),
      child: TextField(
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            //沒有底線
            border: InputBorder.none,
            //提示
            hintText: '輸入電話 0900000000',
          ),
          onChanged: (value) {
            if (isNumber(value)) {
              print('phone number : $value');
            } else {
              Alert(context: context, title: '請輸入數值').show();
            }
          }),
    );
  }

  //Google SignIn
  Widget _googleSignInButton() {
    //在flutter的控件裡常用按鈕有：FlatButton,RaisedButton，FloatingActionButton,OutlineButton
    //FlatButton是扁平的，沒有陰影的。
    //RaisedButton是有陰影，看起來凸起來的。
    //FloatingActionButton是在側面浮起來的那種按鈕。
    //OutlineButton ，帶邊框的按鈕中文叫線框按鈕。
    return OutlineButton(
      //點擊按鈕時水波紋的顏色
      splashColor: Colors.grey,
      //設置按鈕的形狀，半圓角的矩形邊
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      //陰影的範圍，值越大陰影範圍越大
      highlightElevation: 0,
      //邊框顏色
      borderSide: BorderSide(color: Colors.grey),
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

      onPressed: () {
        signInWithGoogle().whenComplete(() {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return FirstScreen();
          }));
        });
      },
    );
  }
}

//判斷是否為數值
bool isNumber(String value) {
  return RegExp('^[0-9]*\$').hasMatch(value);
}
