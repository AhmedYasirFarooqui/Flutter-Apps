// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';
import '../custom.dart';
import '../utils/colors.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
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
                'Log In',
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
                      text: 'Log In',
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
                'Forgot Password?',
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
