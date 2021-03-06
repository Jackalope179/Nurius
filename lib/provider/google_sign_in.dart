import 'package:flutter/cupertino.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_auth/firebase_auth.dart';
// ignore: depend_on_referenced_packages
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final _googleSignIn = GoogleSignIn();
  // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!;
  // final storage = new FlutterSecureStorage();

  Future googleLogin() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return;
      _user = googleUser;
      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      throw ("There's maybe a problem: $e");
    }
    notifyListeners();
  }

  Future logOut() async {
    await _googleSignIn.signOut();
    FirebaseAuth.instance.signOut();
    notifyListeners();
  }
}
