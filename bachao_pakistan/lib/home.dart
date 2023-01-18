// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bachao_pakistan/custom-widgets/custom_buttons.dart';
import 'package:bachao_pakistan/user/login.dart';
import 'package:bachao_pakistan/user/register.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Bachao Pakistan',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
                fontFamily: 'Lato',
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
              ),
            ),
            SizedBox(height: height / 10),
            CustomButtons(
              text: 'Log In',
              onPressed: () async => await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => LoginScreen(),
                ),
              ),
            ),
            SizedBox(height: height / 50),
            CustomButtons(
              text: 'Register',
              onPressed: () async => await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => RegisterScreen(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
