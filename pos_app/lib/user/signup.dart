// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, unused_field

import 'package:flutter/material.dart';
// import 'package:pos_app/login.dart';

import '../custom-widgets/custom_buttons.dart';
import '../custom-widgets/custom_text_field.dart';
// import 'dashboard.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isChecked = false;
  bool obscure = true;
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        toolbarHeight: 90.0,
        leading: Icon(
          Icons.arrow_back_ios,
          color: Color.fromARGB(255, 115, 191, 67),
        ),
      ),
      resizeToAvoidBottomInset: true,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Create an account',
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
                hinttext: 'Name',
                validator: validateName,
                controller: nameController,
                isObscure: false,
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
                isObscure: obscure,
              ),
              CustomTextField(
                hinttext: 'Confirm Password',
                validator: validatePassword,
                controller: confirmPasswordController,
                isObscure: obscure,
              ),
              Row(
                children: [
                  Checkbox(
                    side: BorderSide(
                      width: 1.0,
                      color: Color.fromARGB(255, 155, 155, 155),
                    ),
                    checkColor: Colors.white,
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                        isChecked == true ? obscure = false : obscure = true;
                      });
                    },
                  ),
                  Text('Show Password'),
                ],
              ),
              const SizedBox(
                height: 5.0,
              ),
              CustomButtons(
                text: 'Sign Up',
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.of(context).pushReplacementNamed('dashboard');
                  }
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have an account? '),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacementNamed('login');
                    },
                    child: Text(
                      'Log In',
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

String? validateName(String? name) {
  if (name == null || name.isEmpty) {
    return 'name is required.';
  }
  return null;
}

String? validateEmail(String? email) {
  RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  if (email == null || email.isEmpty) {
    return 'email is required.';
  }
  if (!emailRegex.hasMatch(email)) {
    return 'invalid email';
  }
  return null;
}

String? validatePassword(String? password) {
  RegExp passwordRegex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  if (password == null || password.isEmpty) {
    return 'password is required.';
  }

  if (!passwordRegex.hasMatch(password)) {
    return 'invalid password';
  }
  return null;
}
