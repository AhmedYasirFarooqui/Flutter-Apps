// ignore_for_file: prefer_const_constructors
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import 'onboarding-screen.dart/onboarding_screen.dart';
// import 'home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool animationEnded = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: InkWell(
        onTap: () {
          animationEnded == false
              ? () {}
              : Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => OnboardingScreen(),
                  ),
                );
        },
        child: Container(
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
                SizedBox(
                  child: DefaultTextStyle(
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35.0,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                    ),
                    child: AnimatedTextKit(
                      pause: Duration(milliseconds: 600),
                      // repeatForever: true,
                      totalRepeatCount: 1,
                      animatedTexts: [
                        TyperAnimatedText(
                          'Bachao Pakistan',
                          speed: Duration(milliseconds: 100),
                        ),
                      ],
                      onFinished: () {
                        setState(
                          () {
                            animationEnded = true;
                          },
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: height / 50,
                ),
                animationEnded == false
                    ? SizedBox()
                    : Text(
                        'Tap to enter',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none,
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
