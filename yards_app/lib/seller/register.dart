// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:yards_app/custom_widgets/cusom_text_buttons.dart';

import '../custom_widgets/custom_buttons.dart';
import '../custom_widgets/custom_text_field.dart';
import '../custom_widgets/custom_validator.dart';

class SellerRegistrationScreen extends StatefulWidget {
  const SellerRegistrationScreen({super.key});

  @override
  State<SellerRegistrationScreen> createState() =>
      _SellerRegistrationScreenState();
}

class _SellerRegistrationScreenState extends State<SellerRegistrationScreen> {
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
              SizedBox(height: height / 18),
              Image(
                image: AssetImage('assets/images/anchor.png'),
                width: width / 2,
                height: height / 5,
              ),
              Padding(
                padding: EdgeInsets.only(right: 0),
                child: Text(
                  "Business Account",
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: height / 55),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextField(
                      controller: usernameController,
                      isObscure: false,
                      validator: validateName,
                      hintText: 'Enter Name...',
                      icon: Icons.person,
                    ),
                    SizedBox(height: height / 30),
                    CustomTextField(
                      controller: emailController,
                      isObscure: false,
                      validator: validateEmail,
                      hintText: 'Enter ID Number...',
                      icon: Icons.key,
                    ),
                    SizedBox(height: height / 30),
                    CustomTextField(
                      controller: emailController,
                      isObscure: false,
                      validator: validateEmail,
                      hintText: 'Enter Phone Number...',
                      icon: Icons.phone,
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
                    SizedBox(height: height / 40),
                    Buttons(
                      text: 'Sign Up',
                      textcolor: Color(0xFF163257),
                      buttoncolor: Colors.white,
                      onPressed: () {
                        // if (_formKey.currentState!.validate()) {
                        //   debugPrint('Signed In.');
                        // }
                        Navigator.of(context, rootNavigator: true)
                            .pushReplacementNamed('seller dashboard');
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: height / 65),
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
