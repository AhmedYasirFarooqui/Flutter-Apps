// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Screens extends StatefulWidget {
  const Screens({
    super.key,
    this.title,
    this.subtitle,
  });
  final String? title;
  final String? subtitle;

  @override
  State<Screens> createState() => _ScreensState();
}

class _ScreensState extends State<Screens> {
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
            image: AssetImage('assets/images/work.jpg'),
            colorFilter: ColorFilter.mode(
                Color(0xFF207dff).withOpacity(0.9), BlendMode.srcATop),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.title!,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                ),
              ),
              SizedBox(height: height / 80),
              Text(
                widget.subtitle!,
                style: TextStyle(
                  color: Colors.white,
                  // fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                ),
              ),
            ],
          ),
          // child: Text(
          //   'Bachao Pakistan',
          //   style: TextStyle(
          //     color: Colors.white,
          //     fontSize: 35.0,
          //     fontWeight: FontWeight.bold,
          //     decoration: TextDecoration.none,
          //   ),
          // ),
        ),
      ),
    );
  }
}
