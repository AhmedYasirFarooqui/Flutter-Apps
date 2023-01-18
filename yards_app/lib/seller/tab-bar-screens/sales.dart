// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, unused_local_variable, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class SalesScreen extends StatefulWidget {
  const SalesScreen({super.key});

  @override
  State<SalesScreen> createState() => _SalesScreenState();
}

class _SalesScreenState extends State<SalesScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            InkWell(
              onTap: () {},
              child: Container(
                height: height / 3,
                width: width / 1.03,
                child: Card(
                  child: Column(
                    children: [
                      Container(
                        width: width,
                        height: height / 6,
                        child: Image(
                          image: AssetImage('assets/images/sail.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: height / 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '\$255',
                            style: TextStyle(
                              fontSize: 16.0,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: width / 1.5),
                          Text(
                            '19 Aug',
                            style: TextStyle(
                              fontSize: 16.0,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height / 50),
                      Padding(
                        padding: EdgeInsets.only(right: height * 0.243),
                        child: Text(
                          'Muhammad Hamza',
                          style: TextStyle(
                            fontSize: 16.0,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: height / 50),
                      Padding(
                        padding: EdgeInsets.only(right: height * 0.3),
                        child: Text(
                          '03041234567',
                          style: TextStyle(
                            fontSize: 16.0,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                height: height / 3,
                width: width / 1.03,
                child: Card(
                  child: Column(
                    children: [
                      Container(
                        width: width,
                        height: height / 6,
                        child: Image(
                          image: AssetImage('assets/images/sail.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: height / 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '\$255',
                            style: TextStyle(
                              fontSize: 16.0,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: width / 1.5),
                          Text(
                            '19 Aug',
                            style: TextStyle(
                              fontSize: 16.0,
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height / 50),
                      Padding(
                        padding: EdgeInsets.only(right: height * 0.243),
                        child: Text(
                          'Muhammad Hamza',
                          style: TextStyle(
                            fontSize: 16.0,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: height / 50),
                      Padding(
                        padding: EdgeInsets.only(right: height * 0.3),
                        child: Text(
                          '03041234567',
                          style: TextStyle(
                            fontSize: 16.0,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
