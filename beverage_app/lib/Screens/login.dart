// ignore: avoid_web_libraries_in_flutter
import 'package:beverage_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'menu.dart';
import 'signup.dart';
import 'dart:ui';

// ignore: camel_case_types
class loginPage extends StatefulWidget {
  @override
  _loginPageState createState() => _loginPageState();
}

// ignore: camel_case_types
class _loginPageState extends State<loginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
              child: Image(
                image: AssetImage('images/cafe.jpg'),
                fit: BoxFit.cover,
                height: double.infinity,
                color: Colors.black45,
                colorBlendMode: BlendMode.darken,
              ),
            ),
            IconButton(
              //back button on upper left corner
              icon: Icon(FontAwesomeIcons.arrowLeft, color: Colors.white),
              iconSize: 15.0,
              onPressed: () {
                Navigator.of(context)
                    .pop(MaterialPageRoute(builder: (context) => HomeScreen()));
              },
            ),
            Column(
              children: [
                Center(
                  child: SafeArea(
                    child: Padding(
                      padding: EdgeInsets.only(top: 90.0),
                      child: Text(
                        'Welcome Back!',
                        style: TextStyle(
                            fontSize: 35.0,
                            fontFamily: 'Pacifico',
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Form(
                  child: Theme(
                    data: ThemeData(
                      brightness: Brightness.dark,
                      primarySwatch: Colors.brown,
                      inputDecorationTheme: InputDecorationTheme(
                        labelStyle: TextStyle(
                          color: Colors.brown[300],
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: "Enter Email",
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: "Enter Password",
                            ),
                            keyboardType: TextInputType.text,
                            obscureText: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                MaterialButton(
                  color: Colors.brown[200],
                  textColor: Colors.black,
                  child: Text(
                    'Login',
                    style: TextStyle(fontFamily: 'Pacifico', fontSize: 18.0),
                  ),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => menuScreen()),
                  ),
                  splashColor: Colors.brown,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Divider(
                  indent: 30.0,
                  endIndent: 30.0,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: TextStyle(color: Colors.white),
                    ),
                    InkWell(
                      child: Text(
                        "Sign Up. ",
                        style: TextStyle(
                            color: Colors.blueAccent,
                            decoration: TextDecoration.underline),
                      ),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => signupPage()),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Forgot email/password? ",
                      style: TextStyle(color: Colors.white),
                    ),
                    InkWell(
                      child: Text(
                        "Click here. ",
                        style: TextStyle(
                            color: Colors.blueAccent,
                            decoration: TextDecoration.underline),
                      ),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => signupPage()),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
