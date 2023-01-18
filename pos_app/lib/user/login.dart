// ignore_for_file: prefer_const_constructors, unused_field

import 'package:flutter/material.dart';
import 'package:pos_app/user/signup.dart';
import '../custom-widgets/custom_buttons.dart';
import '../custom-widgets/custom_text_field.dart';
// import 'dashboard.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        toolbarHeight: 90.0,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).popAndPushNamed('signup');
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Color.fromARGB(255, 115, 191, 67),
          ),
        ),
      ),
      resizeToAvoidBottomInset: true,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Login',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              CustomTextField(
                hinttext: 'Email',
                validator: validateEmail,
                controller: emailController,
                isObscure: false,
              ),
              CustomTextField(
                hinttext: 'Password',
                validator: validatePassword,
                controller: passwordController,
                isObscure: true,
              ),
              const SizedBox(
                height: 5.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 210.0),
                child: InkWell(
                  onTap: () {},
                  child: Text(
                    'Forgot Password ?',
                    style: TextStyle(
                      color: Color.fromARGB(255, 115, 191, 67),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              CustomButtons(
                text: 'Log In',
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('dashboard');
                },
              ),
              // SizedBox(
              //   height: 30.0,
              // ),
              // Row(children: const [
              //   Expanded(
              //     child: Divider(
              //       indent: 10.0,
              //       endIndent: 10.0,
              //       thickness: 1.0,
              //       color: Colors.grey,
              //     ),
              //   ),
              //   Text("OR"),
              //   Expanded(
              //     child: Divider(
              //       indent: 10.0,
              //       endIndent: 10.0,
              //       thickness: 1.0,
              //       color: Colors.grey,
              //     ),
              //   ),
              // ]),
              // Text("Or sign in with"),
              // SizedBox(
              //   height: 30.0,
              // ),
              // SocialButtons(
              //   imgPath: 'assets/images/google-logo.png',
              //   text: 'Log in with google',
              // ),
              // SocialButtons(
              //   imgPath: 'assets/images/facebook-logo.png',
              //   text: 'Log in with facebook',
              // ),
              // SizedBox(
              //   height: 20.0,
              // ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 2.5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account? "),
                  InkWell(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.of(context).pushReplacementNamed('signup');
                      }
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 115, 191, 67),
                      ),
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
