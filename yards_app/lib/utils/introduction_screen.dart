// ignore_for_file: prefer_const_constructors

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:yards_app/utils/onboarding_screen.dart';

import 'onboard_images.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  late PageController _pageController;
  bool isLastPage = false;
  List data = [
    OnBoard(
      image: 'assets/images/ferry.png',
      animatedText: DefaultTextStyle(
        style: const TextStyle(
          fontSize: 20.0,
        ),
        child: AnimatedTextKit(
          animatedTexts: [
            WavyAnimatedText('Explore the sea!'),
          ],
          isRepeatingAnimation: true,
          // onTap: () {
          //   print("Tap Event");
          // },
        ),
      ),
    ),
    OnBoard(
      image: 'assets/images/vollyball.png',
      animatedText: DefaultTextStyle(
        style: const TextStyle(
          fontSize: 20.0,
        ),
        child: AnimatedTextKit(
          animatedTexts: [
            WavyAnimatedText('Have Fun and Relax'),
          ],
          isRepeatingAnimation: true,
          // onTap: () {
          //   print("Tap Event");
          // },
        ),
      ),
    ),
    OnBoard(
      image: 'assets/images/dollar.png',
      animatedText: DefaultTextStyle(
        style: const TextStyle(
          fontSize: 20.0,
        ),
        child: AnimatedTextKit(
          animatedTexts: [
            WavyAnimatedText('Buy. Rent. Sell'),
          ],
          isRepeatingAnimation: true,
          // onTap: () {
          //   print("Tap Event");
          // },
        ),
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  int index = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFF163257),
      // backgroundColor: Colors.red,
      body: Column(
        children: [
          SizedBox(
            height: height / 12,
          ),
          isLastPage
              ? Text('')
              : Padding(
                  padding: const EdgeInsets.only(left: 250.0),
                  child: InkWell(
                    onTap: () {
                      _pageController.jumpToPage(2);
                    },
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
          SizedBox(
            width: width,
            height: height / 1.4,
            child: PageView.builder(
              onPageChanged: (index) {
                setState(
                  () {
                    isLastPage = index == 2;
                  },
                );
              },
              controller: _pageController,
              itemCount: data.length,
              itemBuilder: (context, index) => OnBoardingScreen(
                image: data[index].image,
                animatedText: data[index].animatedText,
              ),
            ),
          ),
          isLastPage
              ? Padding(
                  padding: const EdgeInsets.only(top: 50.0, left: 250.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacementNamed('user');
                    },
                    child: Text(
                      'Done',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(left: 250.0, top: 50.0),
                  child: InkWell(
                    onTap: () {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white,
                      ),
                      width: 40,
                      height: 40,
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFF163257),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
