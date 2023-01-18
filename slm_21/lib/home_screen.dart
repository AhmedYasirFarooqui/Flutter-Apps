// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:slm_21/buttons.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

// import 'dashboard.dart';
import 'firebase/firebase_auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<UserCredential?> facebookSignIn() async {
    final LoginResult result = await FacebookAuth.instance.login();
    if (result.status == LoginStatus.success) {
      print('success!');
      Navigator.of(context).pushReplacementNamed('dashboard');
      // Create a credential from the access token
      final OAuthCredential credential =
          FacebookAuthProvider.credential(result.accessToken!.token);
      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50.0,
              ),
              Image(
                image: AssetImage('assets/images/happycow.jpg'),
                width: 230.0,
                height: 230.0,
              ),
              // ignore: avoid_unnecessary_containers
              Column(
                children: [
                  Text(
                    'Smart Livestock',
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.blue[800],
                      fontFamily: 'Simplified Arabic',
                    ),
                  ),
                  Text(
                    'Monitoring',
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.blue[800],
                      fontFamily: 'Simplified Arabic',
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Buttons(
                      text: 'Log In',
                      bwidth: MediaQuery.of(context).size.width / 1.25,
                      bheight: 50.0,
                      textcolor: Colors.white,
                      bcolor: Colors.blue[800],
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed('login');
                      },
                    ),
                    SizedBox(height: 20.0),
                    Buttons(
                      text: 'Sign Up',
                      bwidth: MediaQuery.of(context).size.width / 1.25,
                      bheight: 50.0,
                      textcolor: Colors.white,
                      bcolor: Colors.blue[800],
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed('signup');
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      indent: 10.0,
                      endIndent: 10.0,
                      thickness: 2.0,
                      color: Colors.blue[800],
                    ),
                  ),
                  Text(
                    'OR',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.blue[800],
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      indent: 10.0,
                      endIndent: 10.0,
                      thickness: 2.0,
                      color: Colors.blue[800],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'Sign in with:',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.blue[800],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () async {
                      AuthController.authInstance.googleSignIn();
                    },
                    child: Image(
                      image: AssetImage('assets/images/glogo.png'),
                      width: 40.0,
                      height: 40.0,
                    ),
                  ),
                  SizedBox(
                    width: 80.0,
                  ),
                  InkWell(
                    onTap: () async => facebookSignIn(),
                    child: Image(
                      image: AssetImage('assets/images/flogo.png'),
                      width: 40.0,
                      height: 40.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
