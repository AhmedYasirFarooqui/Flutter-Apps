// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:news_app/utils/colors.dart';

import '../custom.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        color: AppColors.red,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: height / 8,
              ),
              Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.none,
                  color: AppColors.white,
                ),
              ),
              SizedBox(
                height: height / 50,
              ),
              Image(
                image: AssetImage('assets/images/globe.gif'),
                width: width / 5,
                height: height / 8,
              ),
              SizedBox(
                height: height / 80,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextField(
                      controller: usernameController,
                      icon: Icons.person,
                      text: 'Username',
                      keyboardType: TextInputType.name,
                    ),
                    SizedBox(
                      height: height / 30,
                    ),
                    CustomTextField(
                      controller: emailController,
                      icon: Icons.email,
                      text: 'Email',
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: height / 30,
                    ),
                    CustomTextField(
                      controller: passwordController,
                      icon: Icons.visibility_outlined,
                      text: 'Password',
                      isObscure: true,
                      // keyboardType: TextInputType.,
                    ),
                    SizedBox(
                      height: height / 20,
                    ),
                    Buttons(
                      text: 'Sign Up',
                      color: AppColors.white,
                      textcolor: AppColors.red,
                      width: width / 2.15,
                      height: height / 18,
                      onPressed: () =>
                          Navigator.pushNamed(context, "/lib/home.dart"),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height / 20,
              ),
              Text(
                'Already have an account?',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 16.0,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
