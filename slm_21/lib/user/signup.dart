// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:slm_21/buttons.dart';
import 'package:slm_21/text_field.dart';
import '../firebase/firebase_auth.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> signup() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    late final String username = nameController.text;
    late final String email = emailController.text;
    late final String password = passwordController.text;

    auth.createUserWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);
    users.add({
      'username': username,
      'email': email,
      'password': password,
    });
  }

  Future<dynamic> Navigation() async {
    return Navigator.of(context).pushReplacementNamed('dashboard');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 80.0,
            ),
            Image(
              image: AssetImage('assets/images/happycow.jpg'),
              width: 130.0,
              height: 130.0,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 220.0),
              child: Text(
                'Create Account',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.blue[800],
                  decoration: TextDecoration.none,
                  fontFamily: 'Simplified Arabic',
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextField(
                    controller: nameController,
                    hinttext: 'Enter Farm Name',
                    customValidator: usernameValidator,
                    isObscure: false,
                  ),
                  SizedBox(height: 10.0),
                  CustomTextField(
                    controller: emailController,
                    hinttext: 'Enter email',
                    customValidator: emailValidator,
                    isObscure: false,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  CustomTextField(
                    controller: passwordController,
                    hinttext: 'Enter password',
                    customValidator: passwordValidator,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Buttons(
                text: 'Sign Up',
                bwidth: MediaQuery.of(context).size.width,
                bheight: 50.0,
                textcolor: Colors.white,
                bcolor: Colors.blue[800],
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    try {
                      await AuthController.authInstance.register(
                          emailController.text, passwordController.text);
                    } on FirebaseAuthException catch (error) {
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: Center(
                            child: Text(
                              'Error!',
                              style: TextStyle(
                                fontSize: 25.0,
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          content: Text(error.message!),
                          actions: [
                            ErrorDialog(
                              'Retry',
                              () => Navigator.of(context).pop(),
                            ),
                          ],
                        ),
                      );
                    }
                  }
                },
              ),
            ),
            SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "already have an account? ",
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed('home screen');
                  },
                  child: Text(
                    "Log In.",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.blue[800],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

ErrorDialog(String? text, VoidCallback onTap) {
  return Padding(
    padding: EdgeInsets.all(8.0),
    child: InkWell(
      onTap: onTap,
      child: Text(
        '$text',
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
          color: Colors.blue[800],
        ),
      ),
    ),
  );
}

String? usernameValidator(String? username) {
  if (username == null || username.isEmpty) {
    return 'username is required!';
  }
  return null;
}

String? emailValidator(String? email) {
  if (email == null || email.isEmpty) {
    return 'email is required!';
  }

  String pattern = r'\w+@\w+\.\w+';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(email)) {
    return 'Invalid Email Format!';
  }

  return null;
}

String? passwordValidator(String? password) {
  if (password == null || password.isEmpty) {
    return 'password is required!';
  }

  return null;
}
