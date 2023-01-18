// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:yards_app/buyer/login.dart';
import 'package:yards_app/buyer/signup.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import '../custom_widgets/cusom_text_buttons.dart';
import '../custom_widgets/custom_buttons.dart';
// import '../home.dart';
import '../seller/register.dart';
// import '../social-sign-in/facebook_sign_in.dart';
import '../social-sign-in/google_sign_in.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  //this UserCredential?
  // Future<UserCredential?> signInWithGoogle() async {
  //   // Trigger the authentication flow
  //   try {
  //     final GoogleSignInAccount? googleUser = await (GoogleSignIn().signIn());

  //     // Obtain the auth details from the request
  //     final GoogleSignInAuthentication googleAuth =
  //         await googleUser!.authentication;

  //     // Create a new credential
  //     final GoogleAuthCredential credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth.accessToken,
  //       idToken: googleAuth.idToken,
  //     ) as GoogleAuthCredential;

  //     // Once signed in, return the UserCredential
  //     debugPrint('google sign in');
  //     return await FirebaseAuth.instance.signInWithCredential(credential);
  //   } catch (e) {
  //     debugPrint(e.toString());
  //     return null;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: height / 9),
              Image(
                image: AssetImage('assets/images/blue-anchor.png'),
                width: width / 2,
                height: height / 5,
              ),
              SizedBox(height: height / 55),
              Buttons(
                text: 'Log In',
                buttoncolor: Color(0xFF163257),
                textcolor: Colors.white,
                onPressed: () async {
                  await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  );
                },
              ),
              SizedBox(height: height / 95),
              Buttons(
                text: 'Sign Up',
                buttoncolor: Color(0xFF163257),
                textcolor: Colors.white,
                onPressed: () async {
                  await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SignupScreen(),
                    ),
                  );
                },
              ),
              SizedBox(height: height / 35),
              CustomTextButtons(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => SellerRegistrationScreen(),
                    ),
                  );
                },
                text: "I'm a seller",
                color: Color(0xFF163257),
              ),
              SizedBox(height: height / 200.0),
              Text(
                "OR",
                style: TextStyle(
                  fontSize: 17.0,
                  color: Color(0xFF163257),
                ),
              ),
              SizedBox(height: height / 55),
              Text(
                "Sign In Using:",
                style: TextStyle(
                  fontSize: 15.0,
                  color: Color(0xFF163257),
                ),
              ),
              // SizedBox(height: height / 180),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // IconButton(
                  //   icon: Icon(
                  //     FontAwesomeIcons.google,
                  //     size: 35.0,
                  //   ),
                  //   color: Color(0xFF163257),
                  //   onPressed: () async {
                  //     // await signInWithGoogle();
                  //     // final provider = Provider.of<GoogleSignInProvider>(
                  //     //   context,
                  //     //   listen: false,
                  //     // );
                  //     // provider.googleLogin();
                  //     // provider.isLoggedIn == true
                  //     //     ? Navigator.of(context, rootNavigator: true)
                  //     //         .pushReplacementNamed('home')
                  //     //     : debugPrint('not signed in');
                  //   },
                  // ),
                  GestureDetector(
                    onTap: () {},
                    child: Image(
                      image: AssetImage('assets/images/glogo.png'),
                      width: width / 5,
                      height: height / 5,
                    ),
                  ),
                  SizedBox(width: width / 3.5),
                  IconButton(
                    icon: Icon(
                      FontAwesomeIcons.facebookF,
                      size: 35.0,
                    ),
                    color: Color(0xFF163257),
                    onPressed: () {
                      // final provider = Provider.of<FacebookSignInProvider>(
                      //   context,
                      //   listen: false,
                      // );
                      // provider.signInWithFacebook();
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (_) => HomeScreen(),
                      //   ),
                      // );
                    },
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
