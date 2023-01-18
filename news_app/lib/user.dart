// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable

import 'package:flutter/material.dart';
import 'package:news_app/utils/colors.dart';

import 'custom.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        color: AppColors.red,
        child: Column(
          children: [
            SizedBox(
              height: height / 5,
            ),
            Text(
              'WELCOME   TO',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.none,
                color: AppColors.white,
              ),
            ),
            SizedBox(
              height: height / 70,
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(3.0),
              ),
              width: width / 1.8,
              height: height / 18,
              child: Center(
                child: Text(
                  'NEWS ROOM',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w600,
                    decoration: TextDecoration.none,
                    color: AppColors.red,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height / 20,
            ),
            Buttons(
              text: 'Log In',
              color: AppColors.white,
              textcolor: AppColors.red,
              width: width / 2.15,
              height: height / 18,
              onPressed: () => Navigator.pushNamed(context, "/user/login.dart"),
            ),
            SizedBox(
              height: height / 50,
            ),
            Buttons(
              text: 'Sign Up',
              color: AppColors.white,
              textcolor: Color(0xffb02121),
              width: width / 2.15,
              height: height / 18,
              onPressed: () =>
                  Navigator.pushNamed(context, "/user/signup.dart"),
            ),
            SizedBox(
              height: height / 50,
            ),
            Buttons(
              text: 'Enter as Guest',
              color: AppColors.white,
              textcolor: AppColors.red,
              width: width / 2.15,
              height: height / 18,
              onPressed: () => Navigator.pushNamed(context, "/lib/home.dart"),
            ),
            SizedBox(
              height: height / 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Divider(
                    color: AppColors.white,
                    indent: width / 10,
                    endIndent: width / 80,
                    thickness: 1.0,
                    height: 36,
                  ),
                ),
                CustomText(
                  text: 'OR',
                  fontSize: 16.0,
                  color: AppColors.white,
                ),
                Expanded(
                  child: Divider(
                    color: Colors.white,
                    indent: width / 80,
                    endIndent: width / 10,
                    thickness: 1.0,
                    height: 36,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height / 30,
            ),
            CustomText(
              text: 'Sign In With:',
              fontSize: 16.0,
              color: AppColors.white,
            ),
            SizedBox(
              height: height / 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {},
                  child: Image(
                    image: AssetImage('assets/images/glogo.png'),
                    width: 40.0,
                    height: 40.0,
                  ),
                ),
                SizedBox(
                  width: width / 20,
                ),
                InkWell(
                  onTap: () {},
                  child: Image(
                    image: AssetImage('assets/images/flogo.png'),
                    width: 40.0,
                    height: 40.0,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}
