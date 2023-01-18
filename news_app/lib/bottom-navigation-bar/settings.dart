// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
// import 'package:news_app/custom.dart

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool status = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Card(
            elevation: 2.0,
            child: Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              height: 200.0,
              child: Column(
                children: [
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    'Settings',
                    style: TextStyle(
                      color: Color(0xffb02121),
                      fontFamily: 'ZillaSlab',
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 10.0,
                      ),
                      CircleAvatar(
                        radius: 50.0,
                        backgroundColor: Color(0xffb02121),
                        child: FlutterLogo(
                          size: 70.0,
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: Text(
                            'Ahmed Yasir Farooqui',
                            style: TextStyle(
                              color: Color(0xffb02121),
                              fontFamily: 'ZillaSlab',
                              fontSize: 20.0,
                            ),
                          ),
                          subtitle: Text(
                            'yasirfarooqui367@gmail.com',
                            style: TextStyle(
                              color: Color(0xffb02121),
                              fontFamily: 'ZillaSlab',
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 40.0),
                        child: Text(
                          'Sign Out',
                          style: TextStyle(
                            color: Color(0xffb02121),
                            fontWeight: FontWeight.bold,
                            fontFamily: 'ZillaSlab',
                            fontSize: 17.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Card(
            elevation: 2.0,
            child: Container(
              color: Colors.white,
              margin: EdgeInsets.only(
                left: 10.0,
                right: 10.0,
              ),
              height: 120.0,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\t\tDark Mode',
                        style: TextStyle(
                          color: Color(0xffb02121),
                          fontFamily: 'ZillaSlab',
                          fontSize: 18.0,
                        ),
                      ),
                      Switch(
                        activeColor: Colors.white,
                        value: status,
                        onChanged: (val) {
                          setState(() {
                            status = val;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\t\tNotifications',
                        style: TextStyle(
                          color: Color(0xffb02121),
                          fontFamily: 'ZillaSlab',
                          fontSize: 18.0,
                        ),
                      ),
                      Switch(
                        activeColor: Colors.white,
                        value: status,
                        onChanged: (val) {
                          setState(() {
                            status = val;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10.0,
            ),
            child: Text(
              'Account',
              style: TextStyle(
                color: Color(0xffb02121),
                fontFamily: 'ZillaSlab',
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Card(
            elevation: 2.0,
            child: Container(
              color: Colors.white,
              margin: EdgeInsets.only(
                left: 10.0,
                right: 10.0,
              ),
              height: 145.0,
              child: Column(
                children: [
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\t\tEdit Account',
                        style: TextStyle(
                          color: Color(0xffb02121),
                          fontFamily: 'ZillaSlab',
                          fontSize: 18.0,
                        ),
                      ),
                      Icon(
                        Icons.arrow_right,
                        color: Color(0xffb02121),
                        size: 35.0,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\t\tChange Password',
                        style: TextStyle(
                          color: Color(0xffb02121),
                          fontFamily: 'ZillaSlab',
                          fontSize: 18.0,
                        ),
                      ),
                      Icon(
                        Icons.arrow_right,
                        color: Color(0xffb02121),
                        size: 35.0,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\t\tLanguage',
                        style: TextStyle(
                          color: Color(0xffb02121),
                          fontFamily: 'ZillaSlab',
                          fontSize: 18.0,
                        ),
                      ),
                      Icon(
                        Icons.arrow_right,
                        color: Color(0xffb02121),
                        size: 35.0,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10.0,
            ),
            child: Text(
              'Privacy and Security',
              style: TextStyle(
                color: Color(0xffb02121),
                fontFamily: 'ZillaSlab',
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Card(
            elevation: 2.0,
            child: Container(
              margin: EdgeInsets.only(
                left: 10.0,
                right: 10.0,
              ),
              color: Colors.white,
              height: 110.0,
              child: Column(
                children: [
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\t\tPrivate Account',
                        style: TextStyle(
                          color: Color(0xffb02121),
                          fontFamily: 'ZillaSlab',
                          fontSize: 18.0,
                        ),
                      ),
                      Switch(
                        activeColor: Colors.white,
                        value: status,
                        onChanged: (val) {
                          setState(() {
                            status = val;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\t\tPrivacy and Security Help',
                        style: TextStyle(
                          color: Color(0xffb02121),
                          fontFamily: 'ZillaSlab',
                          fontSize: 18.0,
                        ),
                      ),
                      Icon(
                        Icons.arrow_right,
                        color: Color(0xffb02121),
                        size: 35.0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
        ],
      ),
    );
  }
}
