import 'package:flutter/material.dart';
import '../menuOptions.dart';
import '../customCards.dart';

// ignore: camel_case_types
class breakfastScreen extends StatefulWidget {
  @override
  _breakfastScreenState createState() => _breakfastScreenState();
}

// ignore: camel_case_types
class _breakfastScreenState extends State<breakfastScreen> {
  double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
  // ignore: non_constant_identifier_names
  var breakfast_price = [20.0, 10.0, 17.0, 15.0, 23.0];
  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Breakfast',
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontFamily: 'Pacifico'),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomCards(
              'Fried Eggs',
              () => {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => menuOptions(breakfast_price[0],
                        'images/breakfast.jpg', 'Fried Eggs'),
                  ),
                ),
              },
            ),
            CustomCards(
              'Scrambled Eggs',
              () => {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => menuOptions(breakfast_price[1],
                        'images/scrambled-eggs.jpg', 'Scrambled Eggs'),
                  ),
                ),
              },
            ),
            CustomCards(
              'Hot Dog',
              () => {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => menuOptions(breakfast_price[2],
                        'images/hotdogs.jpg', 'Hot Dog'),
                  ),
                ),
              },
            ),
            CustomCards(
              'Cheese Steak',
              () => {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => menuOptions(breakfast_price[3],
                        'images/cheese-steak.jpg', 'Cheese Steak'),
                  ),
                ),
              },
            ),
            CustomCards(
              'Pancakes',
              () => {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => menuOptions(breakfast_price[4],
                        'images/pancakes.jpg', 'Pancakes'),
                  ),
                ),
              },
            ),
          ],
        ),
      ),
    );
  }
}
