import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart' as buttons;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'menu.dart';
import 'login.dart';

// ignore: camel_case_types
class signupPage extends StatefulWidget {
  @override
  _signupPageState createState() => _signupPageState();
}

// ignore: camel_case_types
class _signupPageState extends State<signupPage> {
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
                Navigator.pop(context);
              },
            ),
            Column(
              children: [
                Center(
                  child: SafeArea(
                    child: Padding(
                      padding: EdgeInsets.only(top: 40.0),
                      child: Text(
                        'Welcome!',
                        style: TextStyle(
                            fontSize: 35.0,
                            fontFamily: 'Pacifico',
                            color: Colors.white),
                      ),
                    ),
                  ),
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
                              labelText: "Enter Name",
                            ),
                            keyboardType: TextInputType.text,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: "Enter Phone Number",
                            ),
                            keyboardType: TextInputType.number,
                          ),
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
                    'Sign Up',
                    style: TextStyle(fontFamily: 'Pacifico', fontSize: 18.0),
                  ),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => menuScreen()),
                  ),
                  splashColor: Colors.brown,
                ),
                SizedBox(
                  height: 10.0,
                ),
                buttons.SignInButton(
                  buttons.Buttons.Google,
                  onPressed: () {},
                ),
                buttons.SignInButton(
                  buttons.Buttons.Facebook,
                  onPressed: () {},
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: TextStyle(color: Colors.white),
                    ),
                    InkWell(
                      child: Text(
                        "Login. ",
                        style: TextStyle(
                            color: Colors.blueAccent,
                            decoration: TextDecoration.underline),
                      ),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => loginPage()),
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
