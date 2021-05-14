import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Screens/login.dart';
import 'Screens/signup.dart';
import 'dart:ui';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatelessWidget {
  double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Container(
        color: Colors.brown[100],
        child: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: EdgeInsets.only(
                top: deviceHeight(context) * 0.15,
                left: deviceWidth(context) * 0.04,
                bottom: deviceHeight(context) * 0.001,
              ),
              child: Image(
                image: AssetImage('images/logo2.png'),
                height: 170.0,
                width: 160.0,
              ),
            ),
            Center(
              child: Text(
                'Café Delight',
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontFamily: 'Pacifico',
                  fontSize: 50.0,
                  color: Colors.brown[500],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Buttons(),
            SizedBox(
              height: 100.0,
            ),
            Text(
              "Follow us on: ",
              style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 20.0,
                fontFamily: 'Pacifico',
                color: Colors.brown[500],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  child: Icon(
                    FontAwesomeIcons.facebook,
                    size: 40.0,
                  ),
                  onPressed: () {},
                ),
                MaterialButton(
                  child: Icon(
                    FontAwesomeIcons.instagram,
                    size: 40.0,
                  ),
                  onPressed: () {},
                ),
                MaterialButton(
                  child: Icon(
                    FontAwesomeIcons.snapchat,
                    size: 40.0,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}

class Buttons extends StatefulWidget {
  @override
  _ButtonsState createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.brown[200], elevation: 7.0),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => signupPage()));
          },
          child: Text(
            'Sign Up',
            style: TextStyle(
                fontSize: 20.0, color: Colors.black, fontFamily: 'Pacifico'),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.brown[200], elevation: 7.0),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => loginPage()));
          },
          child: Text(
            'Log In',
            style: TextStyle(
                fontSize: 20.0, color: Colors.black, fontFamily: 'Pacifico'),
          ),
        ),
      ],
    );
  }
}
