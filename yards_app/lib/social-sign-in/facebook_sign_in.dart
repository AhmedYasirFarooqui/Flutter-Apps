// ignore_for_file: unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter/widgets.dart';

class FacebookSignInProvider extends ChangeNotifier {
  Future<UserCredential> signInWithFacebook() async {
    try {
      // Trigger the sign-in flow
      final LoginResult loginResult = await FacebookAuth.instance.login();

      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);
      notifyListeners();
      // Once signed in, return the UserCredential
      return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    } catch (e) {
      debugPrint(e.toString());
      throw e.toString();
    }
  }

  // Future facebookSignIn() async {
  //   try {
  //     final LoginResult result = await FacebookAuth.instance.login(
  //       permissions: [
  //         'public_profile',
  //         'email',
  //         'pages_show_list',
  //         'pages_messaging',
  //         'pages_manage_metadata',
  //       ],
  //     );
  //     if (result.status == LoginStatus.success) {
  //       final AccessToken? accessToken =
  //           await FacebookAuth.instance.accessToken;
  //       debugPrint(result.status.toString());
  //       debugPrint(result.message);
  //       debugPrint('logged in facebook');
  //     }
  //     notifyListeners();
  //   } catch (e) {
  //     debugPrint(e.toString());
  //   }
  // }

  Future logOut() async {
    await FacebookAuth.instance.logOut();
    notifyListeners();
  }
}
