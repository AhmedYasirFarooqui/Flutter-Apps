// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:yards_app/custom_widgets/custom_buttons.dart';
import 'package:yards_app/custom_widgets/custom_text_field.dart';
// import 'package:yards_app/user/signup.dart';

import '../custom_widgets/cusom_text_buttons.dart';
import '../custom_widgets/custom_validator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFF163257),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: height / 9),
              Image(
                image: AssetImage('assets/images/anchor.png'),
                width: width / 2,
                height: height / 5,
              ),
              SizedBox(height: height / 55),
              Padding(
                padding: EdgeInsets.only(right: width * 0.65),
                child: Text(
                  "Log In",
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: height / 25),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextField(
                      controller: emailController,
                      isObscure: false,
                      hintText: 'Enter Email...',
                      validator: validateEmail,
                      icon: Icons.mail,
                    ),
                    SizedBox(height: height / 30),
                    CustomTextField(
                      controller: passwordController,
                      isObscure: true,
                      hintText: 'Enter Password...',
                      validator: validatePassword,
                      icon: Icons.lock,
                    ),
                    SizedBox(height: height / 30),
                    Buttons(
                      text: 'Log In',
                      textcolor: Color(0xFF163257),
                      buttoncolor: Colors.white,
                      onPressed: () {
                        // if (_formKey.currentState!.validate()) {
                        //   debugPrint('Signed In.');
                        // }
                        Navigator.of(context).pushReplacementNamed('home');
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: height / 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have and account? ",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                    ),
                  ),
                  CustomTextButtons(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed('user');
                    },
                    text: "Sign Up",
                    color: Colors.white,
                  ),
                ],
              ),
              CustomTextButtons(
                onPressed: () {},
                text: "Forgot Password",
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
