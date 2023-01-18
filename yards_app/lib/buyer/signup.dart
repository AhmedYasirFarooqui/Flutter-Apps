// ignore_for_file: unused_field, unused_local_variable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:yards_app/custom_widgets/cusom_text_buttons.dart';
import 'package:yards_app/custom_widgets/custom_buttons.dart';
import 'package:yards_app/custom_widgets/custom_text_field.dart';

import '../custom_widgets/custom_validator.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  // Validator validation = Validator();
  TextEditingController usernameController = TextEditingController();
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
                padding: EdgeInsets.only(right: width * 0.62),
                child: Text(
                  "Sign Up",
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
                      controller: usernameController,
                      isObscure: false,
                      validator: validateName,
                      hintText: 'Enter Username...',
                      icon: Icons.person,
                    ),
                    SizedBox(height: height / 30),
                    CustomTextField(
                      controller: emailController,
                      isObscure: false,
                      validator: validateEmail,
                      hintText: 'Enter Email...',
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
                      text: 'Sign Up',
                      textcolor: Color(0xFF163257),
                      buttoncolor: Colors.white,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          debugPrint('Signed In.');
                        }
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
                    "Already have and account? ",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                    ),
                  ),
                  CustomTextButtons(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed('user');
                    },
                    text: "Log In",
                    color: Colors.white,
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
