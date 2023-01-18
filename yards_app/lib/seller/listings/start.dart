// ignore_for_file: prefer_const_constructors, unused_local_variable, unused_field, unused_import

import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:yards_app/seller/listings/add_details.dart';
import 'package:yards_app/seller/listings/add_images.dart';
import 'package:yards_app/seller/listings/add_location.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  late PageController _pageController;
  bool isLastPage = false;
  List screens = [
    AddImagesScreen(),
    AddDetailsScreen(),
    AddLocationScreens(),
  ];
  List titles = [
    'Images',
    'Details',
    'Location',
  ];
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  int count = 0;

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: height / 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  padding: EdgeInsets.only(
                    top: height / 230,
                  ),
                  onPressed: () {
                    isLastPage == false
                        ? Navigator.of(context).pop()
                        : _pageController.previousPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.ease,
                          );
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Color(0xFF163257),
                  ),
                ),
                Text(
                  titles[count],
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF163257),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    isLastPage == true
                        ? Navigator.of(context).pop()
                        : count == 0
                            ? _pageController.jumpToPage(1)
                            : count == 1
                                ? _pageController.jumpToPage(2)
                                : {};
                  },
                  child: isLastPage == true
                      ? Text(
                          'Done',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF163257),
                          ),
                        )
                      : Text(
                          'Next',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF163257),
                          ),
                        ),
                ),
              ],
            ),
            SizedBox(
              width: width,
              height: height / 1.4,
              child: PageView.builder(
                onPageChanged: (index) {
                  setState(
                    () {
                      isLastPage = index == 2;
                      count = index;
                    },
                  );
                },
                controller: _pageController,
                itemCount: screens.length,
                itemBuilder: (context, index) => screens[index],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color:
                          count == 0 ? Colors.transparent : Color(0xFF163257),
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                    color: count == 0 ? Color(0xFF163257) : Colors.white,
                  ),
                  width: width / 5,
                  height: height / 23,
                  child: Center(
                    child: Text(
                      'Step 1',
                      style: TextStyle(
                        color: count == 0 ? Colors.white : Color(0xFF163257),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: width / 20),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color:
                          count == 1 ? Colors.transparent : Color(0xFF163257),
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                    color: count == 1 ? Color(0xFF163257) : Colors.white,
                  ),
                  width: width / 5,
                  height: height / 23,
                  child: Center(
                    child: Text(
                      'Step 2',
                      style: TextStyle(
                        color: count == 1 ? Colors.white : Color(0xFF163257),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: width / 20),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color:
                          count == 2 ? Colors.transparent : Color(0xFF163257),
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                    color: count == 2 ? Color(0xFF163257) : Colors.white,
                  ),
                  width: width / 5,
                  height: height / 23,
                  child: Center(
                    child: Text(
                      'Step 3',
                      style: TextStyle(
                        color: count == 2 ? Colors.white : Color(0xFF163257),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
