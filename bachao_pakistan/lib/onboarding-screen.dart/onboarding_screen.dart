// ignore_for_file: unused_local_variable, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

// import 'package:bachao_pakistan/home.dart';
import 'package:bachao_pakistan/home.dart';
import 'package:bachao_pakistan/onboarding-screen.dart/screens.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController controller = PageController();
  bool isLastPage = false;

  List text = [
    'Earn',
    'Safe',
    'Online Support',
  ];

  List subtext = [
    '100% payment guarantee.',
    'Easy,fast, and secure',
    '24x7 online support'
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: height * 0.1),
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() => isLastPage = index == 2);
          },
          children: [
            Screens(
              title: text[0],
              subtitle: subtext[0],
            ),
            Screens(
              title: text[1],
              subtitle: subtext[1],
            ),
            Screens(
              title: text[2],
              subtitle: subtext[2],
            ),
          ],
        ),
      ),
      bottomSheet: isLastPage
          ? TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Color(0xFFA1DD70),
                minimumSize: Size.fromHeight(
                  height / 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
                elevation: 0.0,
              ),
              child: InkWell(
                onTap: () async {
                  await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                },
                child: Container(
                  width: width,
                  height: height / 12.4,
                  child: Center(
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ),
              ),
              onPressed: () async {},
            )
          : Container(
              padding: EdgeInsets.symmetric(horizontal: height * 0.001),
              height: height / 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    child: Text('SKIP'),
                    onPressed: () => controller.jumpToPage(2),
                  ),
                  Center(
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 3,
                      effect: WormEffect(
                        spacing: 16.0,
                        activeDotColor: Color(0xFF207dff),
                        dotWidth: 10.0,
                        dotHeight: 10.0,
                      ),
                    ),
                  ),
                  TextButton(
                    child: Text('NEXT'),
                    onPressed: () => controller.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
