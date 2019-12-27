import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/services.dart';
import 'package:store/second_screen.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googlesignIn = GoogleSignIn();

//display with google
String name;
String email;
String imageUrl;

//display with phone
String phoneNo;
String smsOTP;
String vericationId;
String errorMessage;

FirebaseUser user;

//phone Authentication
Future<String> verifyPhone() {
  final PhoneCodeSent smsOTPSent = (String verId, [int forceCodeResend]) {
    vericationId = verId;
  };

  //驗證碼對話框
  Future<bool> smsOTPDialog(BuildContext context) {
    return showDialog(
      context: context,
      //是否可取消對話框
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('請輸入驗證碼'),
          content: Container(
            height: 85,
            child: Column(
              children: <Widget>[
                TextField(
                  onChanged: (value) {
                    smsOTP = value;
                  },
                ),
                //錯誤訊息
                errorMessage != ''
                    ? Text(
                        errorMessage,
                        style: TextStyle(color: Colors.red),
                      )
                    : Container()
              ],
            ),
          ),
          contentPadding: const EdgeInsets.all(10),
          actions: <Widget>[
            FlatButton(
              child: Text('確定'),
              onPressed: () {
                //判斷是否已登入，
                _auth.currentUser().then(
                  (user) {
                    if (user != null) {
                      // //返回上一個頁面
                      // Navigator.of(context).pop();
                      // //導航頁面
                      // Navigator.of(context)
                      //     .pushReplacementNamed('/second_screen');
                      print('您已登入');
                    } else {
                      user = signInWithPhone(context) as FirebaseUser;
                      print(user.displayName);
                    }
                  },
                );
              },
            ),
          ],
        );
      },
    );
  }
}

Future<String> signInWithPhone(context) async {
  final AuthCredential _credential = PhoneAuthProvider.getCredential(
    verificationId: vericationId,
    smsCode: smsOTP,
  );
  final AuthResult _result = await _auth.signInWithCredential(_credential);
  final FirebaseUser _user = _result.user;
  final FirebaseUser _currentUser = await _auth.currentUser();
  assert(_user.uid == _currentUser.uid);
  Navigator.of(context).pop();
  Navigator.of(context).pushReplacementNamed('/second_screen');
  return '$_user';
}

//google Authentication
Future<String> signInWithGoogle() async {
  final GoogleSignInAccount _signInAccount = await _googlesignIn.signIn();
  final GoogleSignInAuthentication _signInAuthentication =
      await _signInAccount.authentication;

  final AuthCredential _credential = GoogleAuthProvider.getCredential(
    accessToken: _signInAuthentication.accessToken,
    idToken: _signInAuthentication.idToken,
  );

  final AuthResult _result = await _auth.signInWithCredential(_credential);
  final FirebaseUser _user = _result.user;
  //assert()起到斷言的作用，當assert()中的條件為true時語句會正常執行，如果條件為false 則會拋出一個異常。
  // Checking if email 、 name 、 photoUrl is null
  assert(_user.email != null);
  assert(_user.displayName != null);
  assert(_user.photoUrl != null);

  name = _user.displayName;
  email = _user.email;
  imageUrl = _user.photoUrl;

  // Only taking the first part of the name, i.e., First Name
  if (name.contains(" ")) {
    name = name.substring(0, name.indexOf(" "));
  }

  assert(!_user.isAnonymous);
  assert(await _user.getIdToken() != null);

  final FirebaseUser _currentUser = await _auth.currentUser();
  assert(_user.uid == _currentUser.uid);

  return 'signInWithGoogle succeeded: $_user';
}

void signOutGoogle() async {
  await _googlesignIn.signOut();
  print("User Sign Out");
}
