// ignore_for_file: unused_local_variable, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, use_build_context_synchronously

import 'dart:convert';

import 'package:bachao_pakistan/custom-widgets/custom_buttons.dart';
import 'package:bachao_pakistan/custom-widgets/custom_text_field.dart';
import 'package:bachao_pakistan/admin/admin_dashboard.dart';
import 'package:bachao_pakistan/user/transaction.dart';
import 'package:bachao_pakistan/user/user_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

String? finalEmail;
String? finalPassword;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obscured = true;
  dynamic getmail;
  dynamic getpassword;
  showError(String title, errorMessage) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            title,
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            errorMessage,
            style: TextStyle(
              color: Color(0xFF207dff),
            ),
          ),
          actions: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Ok',
                  style: TextStyle(
                    color: Color(0xFF207dff),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void login(String email, password) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    try {
      http.Response response = await http.post(
        Uri.parse('https://bachaopakistan.com/demo/public/api/login'),
        body: {
          'email': email,
          'password': password,
        },
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        final keysList = data.keys.toList();
        final valuesList = data.values.toList();
        if (data.keys.first != 'error') {
          pref.setString('email', email);
          pref.setString('password', password);
          getmail = pref.getString('email');
          getpassword = pref.getString('password');
          debugPrint(getmail);
          debugPrint(getpassword);
          if (getmail == 'admin@admin.com') {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => AdminDashboard(),
              ),
            );
          } else {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    DashboardScreen(isapproved: data['status']),
              ),
            );
            // if (data['status'] == 'inactive') {
            //   Navigator.pushReplacement(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) =>
            //           TransactionScreen(approved: data['status']),
            //     ),
            //   );
            // } else {
            //   Navigator.pushReplacement(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) =>
            //           DashboardScreen(isapproved: data['status']),
            //     ),
            //   );
            // }
          }
        } else {
          showError(data.keys.first, data.values.first);
        }
      }
    } catch (e) {
      showError('error', e.toString());
    }
  }

  Future validateCredentials() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final getmail = pref.getString('email');
    final getpassword = pref.getString('password');
    finalEmail = getmail;
    finalPassword = getpassword;
  }

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.white;
    }
    return Colors.white;
  }

  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    validateCredentials().whenComplete(
      () async {
        if (finalEmail != null) {
          if (finalEmail == 'admin@admin.com') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AdminDashboard(),
              ),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TransactionScreen(),
              ),
            );
          }
        } else {}
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/work-2.jpg'),
              colorFilter: ColorFilter.mode(
                Color(0xFF207dff).withOpacity(0.9),
                BlendMode.srcATop,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: height / 5),
              Text(
                'Log In',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                ),
              ),
              SizedBox(height: height / 15),
              CustomTextField(
                // icon: Icons.mail,
                controller: emailController,
                borderColor: Colors.white,
                hintText: 'Enter Email...',
              ),
              SizedBox(height: height / 25),
              CustomTextField(
                // icon: Icons.lock,
                controller: passwordController,
                borderColor: Colors.white,
                hintText: 'Enter Password...',
                isObscure: obscured,
              ),
              SizedBox(height: height / 60),
              Row(
                children: [
                  SizedBox(width: width / 20),
                  Checkbox(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3.0),
                    ),
                    checkColor: Color(0xFF207dff),
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(
                        () {
                          isChecked = value!;
                          isChecked == true
                              ? obscured = false
                              : obscured = true;
                        },
                      );
                    },
                  ),
                  Text(
                    'Show Password',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ],
              ),
              SizedBox(height: height / 60),
              CustomButtons(
                text: 'Log In',
                onPressed: () {
                  login(emailController.text, passwordController.text);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
