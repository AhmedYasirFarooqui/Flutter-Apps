import 'package:flutter/material.dart';
import '../customCards.dart';
import '../menuOptions.dart';

class CoffeeScreen extends StatefulWidget {
  @override
  _CoffeeScreenState createState() => _CoffeeScreenState();
}

class _CoffeeScreenState extends State<CoffeeScreen> {
  double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
  // ignore: non_constant_identifier_names
  var coffee_price = [20.0, 10.0, 17.0, 15.0, 23.0, 25.0];
  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Coffee',
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
              'Cappuccino',
              () => {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        menuOptions(coffee_price[0], 'images/cappuccino.jpg', 'Cappuccino Hot Coffee'),
                  ),
                ),
              },
            ),
            CustomCards('Mucha', () => {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      menuOptions(coffee_price[1], 'images/mocha.jpg', 'Mocha Latte'),
                ),
              ),
            },),
            CustomCards('Latte', () => {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      menuOptions(coffee_price[2], 'images/latte.jpg', 'Latte'),
                ),
              ),
            },),
            CustomCards('Americano', () => {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      menuOptions(coffee_price[3], 'images/americano3.jpg', 'Americano'),
                ),
              ),
            },),
            CustomCards('Espresso', () => {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      menuOptions(coffee_price[4], 'images/espresso.jpg', 'Espresso'),
                ),
              ),
            },),
            CustomCards('Flat White', () => {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      menuOptions(coffee_price[5], 'images/flat-white.jpg', 'Flat White Delight'),
                ),
              ),
            },),
          ],
        ),
      ),
    );
  }
}

