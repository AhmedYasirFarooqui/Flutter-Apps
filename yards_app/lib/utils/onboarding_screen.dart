// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key, this.image, this.animatedText});
  final String? image;
  final Widget? animatedText;

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFF163257),
      // backgroundColor: Colors.red,
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image(
                image: AssetImage(widget.image!),
                width: width / 1.9,
                height: height / 1.9,
              ),
            ),
            widget.animatedText!,
          ],
        ),
      ),
    );
  }
}
