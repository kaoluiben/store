import 'package:flutter/material.dart';

class SignInfo extends StatelessWidget {
  Map<String, dynamic> result;
  Map<String, dynamic> data;
  List sheetInfo;
  SignInfo(this.result);

  @override
  Widget build(BuildContext context) {
    for (var i = 0; i < result['SignInfo'].length; i++) {
      data = result['SignInfo'][i] as Map<String, dynamic>;
      for (var key in data.keys) {
        if (key == 'sheetNo') {
          print('$data');
        }
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('SignInfo'),
      ),
      body: new Center(
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[Text('$data')],
            ),
          ],
        ),
      ),
    );
  }
}
