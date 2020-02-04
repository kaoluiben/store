import 'package:flutter/material.dart';
import 'dart:convert';

class SignInfo extends StatelessWidget {
  Map<String, dynamic> result;
  Map<String, dynamic> data;
  SignInfo(this.result);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: result['SignInfo'].length,
          itemBuilder: (context, index) {
            data = (result['SignInfo'][index]);
            print('$data');
            return ListTile(
              title: Text('$data'),
            );
          }),
    );
  }
}
