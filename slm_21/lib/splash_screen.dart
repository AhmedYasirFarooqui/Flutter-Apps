// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_print

import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'firebase/firebase_auth.dart';
import 'firebase/firebase_constant.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static String? mytoken;

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    getToken();
    firebaseInitialization.then((value) {
      Get.put(AuthController());
    });
  }

  getToken() {
    var messaging = FirebaseMessaging.instance;
    messaging.getToken().then((value) {
      debugPrint('device token = $value');
      log(value!);
      SplashScreen.mytoken = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: InkWell(
          onTap: () => Navigator.of(context).pushReplacementNamed('intro page'),
          child: Center(
            child: Image(
              image: const AssetImage('assets/images/happycow.jpg'),
              width: MediaQuery.of(context).size.width / 1.25,
              height: MediaQuery.of(context).size.height / 1.25,
            ),
          ),
        ),
      ),
    );
  }
}
