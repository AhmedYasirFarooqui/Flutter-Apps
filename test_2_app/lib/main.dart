// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List images = [
    'assets/images/cr-1.jpg',
    'assets/images/cr-2.jpg',
    'assets/images/cr-3.jpg',
  ];

  int _current = 0;

  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: width,
            height: height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.white,
                  Colors.blue,
                ],
              ),
            ),
          ),
          Container(
            width: width,
            height: height / 2.3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(150.0),
                bottomRight: Radius.circular(150.0),
              ),
              color: Colors.white,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 60.0, left: 320.0),
                  child: Icon(Icons.logout, color: Colors.blue),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 240.0),
                  child: Text(
                    'Welcome,\n Jobin',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
                SizedBox(
                  height: 6.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 240.0),
                  child: Text(
                    'Your Balance',
                    style: TextStyle(
                      fontSize: 18.0,
                      // fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 220.0),
                  child: Text(
                    'AED 0.0',
                    style: TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                SizedBox(
                  height: height / 4.5,
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: 400.0,
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      },
                    ),
                    items: images.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(20.0),
                              image: DecorationImage(
                                image: AssetImage(
                                  i,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: images.map((url) {
                    int index = images.indexOf(url);
                    return Container(
                      width: 10.0,
                      height: 10.0,
                      margin: EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 5,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _current == index
                            ? Colors.white
                            : Color.fromRGBO(0, 0, 0, 0.2),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: 25.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(),
                    Text(
                      'For Family',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 5.0),
                    Text(
                      'For Domestic Worker',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    options(
                      Icons.person_add,
                      'Create Account',
                      width / 4.5,
                      height / 10,
                      10.0,
                    ),
                    options(
                      Icons.money,
                      'Transfer Money',
                      width / 4.5,
                      height / 10,
                      10.0,
                    ),
                    options(
                      Icons.person_add,
                      'Create Account',
                      width / 4.5,
                      height / 10,
                      10.0,
                    ),
                    options(
                      Icons.money,
                      'Process Salary',
                      width / 4.5,
                      height / 10,
                      10.0,
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: options(
                        Icons.money,
                        'Apply Staff Card',
                        width / 2.1,
                        height / 5,
                        13.0,
                      ),
                    ),
                    SizedBox(width: 7.0),
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: options(
                        Icons.money,
                        'Process Staff Salary',
                        width / 2.1,
                        height / 5,
                        13.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: anotherOptions(
                        Icons.money,
                        'Register Payments',
                        width / 2.1,
                        height / 10,
                        11.0,
                      ),
                    ),
                    SizedBox(width: 7.0),
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: anotherOptions(
                        Icons.person_add,
                        'Manage Accounts',
                        width / 2.1,
                        height / 10,
                        11.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 7.0),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget anotherOptions(
    IconData icon,
    String text,
    double width,
    double height,
    double fontsize,
  ) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.blue),
          SizedBox(width: 8.0),
          Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: fontsize,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(width: 8.0),
          Icon(
            Icons.arrow_drop_down_rounded,
            color: Colors.blue,
            size: 30.0,
          ),
        ],
      ),
    );
  }

  Widget options(
    IconData icon,
    String text,
    double width,
    double height,
    double fontsize,
  ) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.blue),
          SizedBox(height: 8.0),
          Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: fontsize,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
