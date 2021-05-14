import 'package:flutter/material.dart';
import '../menuOptions.dart';
import '../customCards.dart';
// ignore: camel_case_types
class soupScreen extends StatefulWidget {
  @override
  _soupScreenState createState() => _soupScreenState();
}

// ignore: camel_case_types
class _soupScreenState extends State<soupScreen> {
  double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
  // ignore: non_constant_identifier_names
  var soup_price = [20.0, 10.0, 17.0, 15.0, 23.0, 25.0];
  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Soup',
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontFamily: 'Pacifico'),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomCards('Chicken Soup', () => {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => menuOptions(soup_price[0],
                      'images/chicken-soup.jpg', 'Chicken Soup'),
                ),
              ),
            },),
            CustomCards('Corn Soup', () => {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => menuOptions(soup_price[1],
                      'images/corn-soup.jpg', 'Corn Soup'),
                ),
              ),
            },),
            CustomCards('Tomato Soup', () => {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => menuOptions(soup_price[2],
                      'images/tomato-soup.jpg', 'Tomato Soup'),
                ),
              ),
            },),
            CustomCards('Carrot Soup', () => {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => menuOptions(soup_price[3],
                      'images/carrot-soup.jpg', 'Carrot Soup'),
                ),
              ),
            },),
            CustomCards('vegetable Soup', () => {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => menuOptions(soup_price[4],
                      'images/vegetable-soup.jpg', 'Vegetable Soup'),
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

