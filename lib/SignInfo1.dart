import 'package:flutter/material.dart';
import 'dart:convert';

class SignInfo extends StatelessWidget {
  dynamic result;
  Map<String, dynamic> data;
  SignInfo(this.result);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('未簽章筆數'),
      ),
      body: ListView.builder(
          itemCount: result['SignInfo'].length,
          itemBuilder: (context, index) {
            String sheetName = result['SignInfo'][index]['sheetName'];
            String sheetNo = result['SignInfo'][index]['sheetNo'];
            int sheetCount = result['SignInfo'][index]['sheetCount'];
            return ListTile(
              title: Text('$sheetName : ' + sheetCount.toString() + '筆 '),
            );
            // return new Card(
            //   child: new Container(
            //     padding: new EdgeInsets.all(10.0),
            //     child: new Column(
            //       children: <Widget>[
            //         new CheckboxListTile(
            //             //value: sheetCount,
            //             title: Text(
            //                 '$sheetName : ' + sheetCount.toString() + '筆 '),
            //             //controlAffinity: ListTileControlAffinity.leading,
            //             onChanged: (bool val) {
            //               //ItemChange(val, index);
            //             })
            //       ],
            //     ),
            //   ),
            // );
          }),
    );
  }
}
