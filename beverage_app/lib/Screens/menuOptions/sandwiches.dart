import 'package:flutter/material.dart';
import '../menuOptions.dart';
import '../customCards.dart';

// ignore: camel_case_types
class sandwhichScreen extends StatefulWidget {
  @override
  _sandwhichScreenState createState() => _sandwhichScreenState();
}

// ignore: camel_case_types
class _sandwhichScreenState extends State<sandwhichScreen> {
  double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
  // ignore: non_constant_identifier_names
  var sandwich_price = [20.0, 10.0, 17.0, 15.0, 23.0, 25.0];
  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Sandwhich',
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontFamily: 'Pacifico'),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomCards('Beef Sandwhich', () => {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      menuOptions(sandwich_price[0], 'images/beef.jpg', 'Beef Sandwich'),
                ),
              ),
            },),
            CustomCards('Chicken Sandwhich', () => {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      menuOptions(sandwich_price[1], 'images/chicken.jpg', 'Chicken Sandwich'),
                ),
              ),
            },),
            CustomCards('Cheese Sandwhich', () => {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      menuOptions(sandwich_price[2], 'images/cheese.jpg', 'Cheese Sandwich'),
                ),
              ),
            },),
            CustomCards('Tuna Sandwhich', () => {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      menuOptions(sandwich_price[3], 'images/tuna.jpg', 'Tuna Sandwich'),
                ),
              ),
            },),
            CustomCards('Turkey Sandwhich', () => {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      menuOptions(sandwich_price[4], 'images/turkey.jpg', 'Turkey Sandwich'),
                ),
              ),
            },),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
