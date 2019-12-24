import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _signIn = GoogleSignIn();

String name;
String email;
String imageUrl;

Future<String> signInWithGoogle() async {
  final GoogleSignInAccount _signInAccount = await _signIn.signIn();
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
  await _signIn.signOut();
  print("User Sign Out");
}
