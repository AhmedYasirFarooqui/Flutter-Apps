// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      await _googleSignIn.signOut();
      await FacebookAuth.instance.logOut();
      Navigator.of(context).pushReplacementNamed('home screen');
    } on FirebaseAuthException catch (error) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text(
            'Error!',
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(error.message!),
          actions: [
            InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: Text(
                "OK",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.blue[800],
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80.0,
        backgroundColor: Color.fromRGBO(21, 101, 192, 1),
        title: Text(
          'Settings',
          style: TextStyle(
              fontSize: 30.0, fontWeight: FontWeight.w600, color: Colors.white
              // color: Colors.blue[800],
              ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30.0,
            ),
            InkWell(
              onTap: () {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: Text(
                      'Phone Number',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.blue[800],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    content: Row(
                      children: [
                        Icon(
                          Icons.phone,
                          color: Colors.blue[800],
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Text(
                          '0304-2490209',
                          style: TextStyle(
                            letterSpacing: 1.5,
                          ),
                        ),
                      ],
                    ),
                    actions: [
                      InkWell(
                        onTap: () => Navigator.of(context).pop(),
                        child: Text(
                          "Ok",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.blue[800],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 10.0,
                  ),
                  Icon(
                    Icons.phone,
                    color: Colors.blue[800],
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Text(
                    'Phone Number',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[800],
                      fontSize: 17.0,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            InkWell(
              onTap: () {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (ctx) => AlertDialog(
                    insetPadding: EdgeInsets.zero,
                    title: Text(
                      'Email',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.blue[800],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    content: Row(
                      children: [
                        Icon(
                          Icons.mail,
                          color: Colors.blue[800],
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Text(
                          'yasirfarooqui367@gmail.com',
                          style: TextStyle(
                            letterSpacing: 1.5,
                          ),
                        ),
                      ],
                    ),
                    actions: [
                      InkWell(
                        onTap: () => Navigator.of(context).pop(),
                        child: Text(
                          "Ok",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.blue[800],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              child: Row(
                children: [
                  SizedBox(
                    width: 10.0,
                  ),
                  Icon(
                    Icons.mail,
                    color: Colors.blue[800],
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Text(
                    'Email',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[800],
                      fontSize: 17.0,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            InkWell(
              onTap: () {
                AdaptiveTheme.of(context).toggleThemeMode();
              },
              child: Row(
                children: [
                  SizedBox(
                    width: 10.0,
                  ),
                  Icon(
                    Icons.sunny,
                    color: Colors.blue[800],
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Text(
                    'Dark Theme',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[800],
                      fontSize: 17.0,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            InkWell(
              onTap: () => showLicensePage(
                context: context,
                applicationName: 'SLM-21',
                applicationVersion: '0.1',
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 10.0,
                  ),
                  Icon(
                    Icons.security,
                    color: Colors.blue[800],
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Text(
                    'License',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[800],
                      fontSize: 17.0,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            InkWell(
              onTap: () => Navigator.of(context)
                  .pushReplacementNamed('terms and conditions'),
              child: Row(
                children: [
                  SizedBox(
                    width: 10.0,
                  ),
                  Icon(
                    Icons.list_alt_outlined,
                    color: Colors.blue[800],
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Text(
                    'Terms and Conditions',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[800],
                      fontSize: 17.0,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10.0,
                ),
                Icon(
                  Icons.logout,
                  color: Colors.blue[800],
                ),
                SizedBox(
                  width: 8.0,
                ),
                InkWell(
                  child: Text(
                    'Log Out',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[800],
                      fontSize: 17.0,
                    ),
                  ),
                  onTap: logout,
                ),
              ],
            ),
            SizedBox(height: 90.0),
            Text('copyright@ SLM-21'),
          ],
        ),
      ),
    );
  }
}
