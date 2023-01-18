// ignore_for_file: unused_local_variable, prefer_const_constructors

import 'package:flutter/material.dart';

import '../../custom_widgets/another_custom_search_bar.dart';

class AddLocationScreens extends StatefulWidget {
  const AddLocationScreens({super.key});

  @override
  State<AddLocationScreens> createState() => _AddLocationScreensState();
}

class _AddLocationScreensState extends State<AddLocationScreens> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: height / 20),
          Padding(
            padding: EdgeInsets.only(right: height * 0.2),
            child: const Text(
              'Product Pickup Location',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF163257),
              ),
            ),
          ),
          AnotherCustomSearchBar(hinttext: 'pickup location...'),
          SizedBox(height: height / 30),
          Padding(
            padding: EdgeInsets.only(right: height * 0.212),
            child: const Text(
              'Seller Contact Number',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF163257),
              ),
            ),
          ),
          AnotherCustomSearchBar(hinttext: 'contact number...'),
          SizedBox(
            height: height / 15,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image(
              image: AssetImage(
                'assets/images/maps.PNG',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
