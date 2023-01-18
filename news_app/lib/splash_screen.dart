// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:news_app/user.dart';

import 'custom.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({Key? key}) : super(key: key);

  @override
  _splashScreenState createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => UserScreen())),
        child: Container(
          color: Color(0xffb02121),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('assets/images/globe.gif'),
                width: 150.0,
                height: 150.0,
              ),
              SizedBox(
                height: 50.0,
              ),
              CustomText(
                text: 'Tap To Enter',
                fontSize: 20.0,
                fontFamily: "ZillaSlab",
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
