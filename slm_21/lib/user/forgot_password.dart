// ignore_for_file: prefer_const_constructors
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:slm_21/buttons.dart';
import 'package:slm_21/text_field.dart';
import 'package:slm_21/user/signup.dart';

class ForGotPassword extends StatefulWidget {
  const ForGotPassword({Key? key}) : super(key: key);

  @override
  State<ForGotPassword> createState() => _ForGotPasswordState();
}

class _ForGotPasswordState extends State<ForGotPassword> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  Future<void> resetPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: email,
      );
      debugPrint('link sent!');
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
    Navigator.of(context).pushReplacementNamed('login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Enter Email',
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.blue[800],
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          CustomTextField(
            key: _formKey,
            hinttext: 'Enter Email',
            controller: emailController,
            customValidator: emailValidator,
            isObscure: false,
          ),
          SizedBox(
            height: 10.0,
          ),
          Buttons(
            bwidth: MediaQuery.of(context).size.width / 2,
            bheight: MediaQuery.of(context).size.height / 14,
            text: 'Reset Password',
            textcolor: Colors.white,
            bcolor: Colors.blue[800],
            onPressed: () async => resetPassword(emailController.text.trim()),
          ),
        ],
      ),
    );
  }
}
