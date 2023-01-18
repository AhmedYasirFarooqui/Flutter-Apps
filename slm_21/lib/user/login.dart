// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers, non_constant_identifier_names
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:slm_21/buttons.dart';
import 'package:slm_21/text_field.dart';
import 'package:slm_21/user/signup.dart';
import '../firebase/firebase_auth.dart';
// import '../home_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FirebaseAuth auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    auth.signInWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);
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
              padding: const EdgeInsets.only(right: 170.0),
              child: Text(
                'Log In to your account',
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
                    hinttext: 'Enter email',
                    controller: emailController,
                    customValidator: emailValidator,
                    isObscure: false,
                  ),
                  SizedBox(height: 20.0),
                  CustomTextField(
                    hinttext: 'Enter password',
                    controller: passwordController,
                    customValidator: passwordValidator,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Buttons(
                text: 'Log In',
                bwidth: MediaQuery.of(context).size.width,
                bheight: 50.0,
                textcolor: Colors.white,
                bcolor: Colors.blue[800],
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    try {
                      await AuthController.authInstance
                          .login(emailController.text, passwordController.text);
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
                  "Don't have an account? ",
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed('home screen');
                  },
                  child: Text(
                    "create account.",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.blue[800],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushReplacementNamed('forgot password');
              },
              child: Text(
                "Forgot Password",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.blue[800],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
