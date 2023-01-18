// ignore_for_file: prefer_const_constructors, unused_local_variable, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../custom-widgets/custom_profile_cards.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80.0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'Profile',
          style: TextStyle(
            color: Colors.black,
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              image: DecorationImage(
                opacity: 0.1,
                image: AssetImage('assets/images/books.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: height / 40),
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage('assets/images/me.jpeg'),
                ),
                SizedBox(height: height / 50),
                Text(
                  'Ahmed Yasir Farooqui',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: height / 30),
                MyCards(),
                SizedBox(height: height / 50),
                MyCards(),
                SizedBox(height: height / 50),
                MyCards(),
                SizedBox(height: height / 50),
                MyCards(),
                SizedBox(height: height / 50),
                MyCards(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
