// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:slm_21/dashboard.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../home_screen.dart';
import '../intro.dart';
import 'firebase_constant.dart';

class AuthController extends GetxService {
  static AuthController authInstance = Get.find();
  late Rx<User?> firebaseUser;
  bool userLogin = false;
  bool googleUserFlag = false;
  Rx<bool> googleLoading = true.obs;

  final dynamic isConnected = InternetConnectionChecker().hasConnection;

  @override
  void onReady() async {
    super.onReady();
    firebaseUser = Rx<User?>(auth.currentUser);
    debugPrint(firebaseUser.toString());
    //if(firebaseUser.value == true)
    var listener = InternetConnectionChecker().onStatusChange.listen((status) {
      switch (status) {
        case InternetConnectionStatus.connected:
          _setInitialScreen(firebaseUser.value);
          debugPrint('Data connection is available.');
          break;
        case InternetConnectionStatus.disconnected:
          debugPrint('You are disconnected from the internet.');
          break;
      }
    });

    // close listener after 30 seconds, so the program doesn't run forever
    await Future.delayed(Duration(seconds: 30));
    await listener.cancel();
  }
  // firebaseUser.bindStream(auth.userChanges());
  //  ever(firebaseUser, _setInitialScreen);

  _setInitialScreen(user) {
    if (user != null) {
      Future.delayed(const Duration(seconds: 2), (() {
        Get.offAll(() => const DashboardPage(),
            transition: Transition.leftToRight);
      }));

      userLogin = true;
    } else {
      Future.delayed(const Duration(seconds: 3), (() {
        Get.offAll(() => const IntroPage(), transition: Transition.fadeIn);
      }));

      userLogin = false;
    }
  }

  Future<void> register(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      Get.offAll(() => const DashboardPage());
    } on FirebaseAuthException catch (e) {
      debugPrint(e.code);

      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      Get.offAll(() => const DashboardPage());
    } on FirebaseAuthException catch (e) {
      debugPrint(e.code);

      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  void googleSignIn() async {
    try {
      googleLoading.value = false;
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      await auth.signInWithCredential(credential);
      googleUserFlag = true;
      googleLoading.value = true;
      Get.offAll(() => const DashboardPage());
    } on FirebaseAuthException catch (e) {
      debugPrint(e.code);
      rethrow;
    } catch (e) {
      Text(e.toString());
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      debugPrint(e.code);
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signOut() async {
    Get.defaultDialog(
      title: '',
      titleStyle: const TextStyle(fontSize: 0),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      content: Column(
        children: [
          const Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Sign Out',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Align(
            alignment: Alignment.topLeft,
            child: Text('Are you sure?'),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    width: 90,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                      border: Border(),
                    ),
                    child: Center(
                      child: Text(
                        'CANCEL',
                        style: const TextStyle(
                          //     fontFamily: btnFontsFamily,
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () async {
                  try {
                    googleUserFlag ? GoogleSignIn().disconnect() : null;
                    await auth.signOut();
                    googleUserFlag = false;
                    Get.to(() => const HomePage());
                  } catch (e) {
                    rethrow;
                  }
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    width: 90,
                    height: 40,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                          Colors.black,
                          Colors.black26
                          // appThemeColor1,
                          // appThemeColor2,
                        ])),
                    child: const Center(
                      child: Text(
                        'Sign Out',
                        style: TextStyle(
                          // fontFamily: btnFontsFamily,
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
