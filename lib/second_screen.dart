import 'package:flutter/material.dart';
import 'login_page.dart';
import 'sign_in.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(
            user.displayName,
          ),
        ),
      ),
    );
  }
}
