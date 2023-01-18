import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  bool? isLoggedIn;

  Future googleLogin() async {
    try {
      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) return;
      _user = googleUser;

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final GoogleAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      ) as GoogleAuthCredential;
      isLoggedIn = true;
      await FirebaseAuth.instance.signInWithCredential(credential);
      notifyListeners();
    } on PlatformException catch (err) {
      if (err.code == 'sign_in_canceled') {
        debugPrint(err.toString());
      } else {
        return;
      }
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    GoogleSignIn().disconnect();
    if (GoogleSignIn().currentUser == null) {
      debugPrint('signout success');
    } else {
      debugPrint('still signed in.');
    }
    notifyListeners();
  }
}
