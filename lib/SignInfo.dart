import 'package:flutter/material.dart';
import 'dart:convert';

class SignInfo extends StatefulWidget {
  dynamic result;
  SignInfo(this.result);
  @override
  State<StatefulWidget> createState() {
    return _SignInfo(result);
  }
}

class _SignInfo extends State<SignInfo> {
  dynamic result;
  _SignInfo(this.result);
  List<String> _selected = new List();

  void _onSelected(bool selected, String sheetNo) {
    print('sheetNo :' + sheetNo + ', selected :' + selected.toString());
    if (selected == true) {
      setState(() {
        _selected.add(sheetNo);
      });
    } else {
      setState(() {
        _selected.remove(sheetNo);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    for (var i = 0; i < result['SignInfo'].length; i++) {
      _selected.add(result['SignInfo'][i]['sheetNo']);
    }

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

            return new Card(
              child: new Container(
                padding: new EdgeInsets.all(10.0),
                child: new Column(
                  children: <Widget>[
                    new CheckboxListTile(
                      title: Text(
                          '$sheetName :   ' + sheetCount.toString() + '  筆   '),
                      value: _selected.contains(sheetNo),
                      controlAffinity: ListTileControlAffinity.leading,
                      selected: _selected.contains(sheetNo),
                      onChanged: (_value) {
                        //setState(() {
                        _onSelected(_value, sheetNo);
                        //});
                      },
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
