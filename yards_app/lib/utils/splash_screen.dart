// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:yards_app/utils/introduction_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  Splash createState() => Splash();
}

class Splash extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Timer(
      Duration(seconds: 10),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => IntroductionScreen(),
        ),
      ),
    );

    var assetsImage = new AssetImage('assets/images/anchor.png');
    var image = new Image(
      image: assetsImage,
      width: width / 1.9,
      height: height / 1.9,
    );

    return Scaffold(
      backgroundColor: Color(0xFF163257),
      body: Center(
        child: Column(
          children: [
            Spacer(),
            image,
            Spacer(),
            DefaultTextStyle(
              style: const TextStyle(
                fontSize: 20.0,
              ),
              child: AnimatedTextKit(
                animatedTexts: [
                  WavyAnimatedText('Ahoy, Mate'),
                ],
                isRepeatingAnimation: true,
                // onTap: () {
                //   print("Tap Event");
                // },
              ),
            ),
            SizedBox(
              height: height / 3.5,
            ),
          ],
        ),
      ),
    );
  }
}
