import 'package:flutter/material.dart';
import '../menuOptions.dart';
import '../customCards.dart';

// ignore: camel_case_types
class teaScreen extends StatefulWidget {
  @override
  _teaScreenState createState() => _teaScreenState();
}

// ignore: camel_case_types
class _teaScreenState extends State<teaScreen> {
  double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
  // ignore: non_constant_identifier_names
  var tea_price = [20.0, 10.0, 17.0, 15.0, 23.0, 25.0];
  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Tea',
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
              'Regular Tea',
              () => {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => menuOptions(
                        tea_price[0], 'images/t.jpg', 'Regular Tea'),
                  ),
                ),
              },
            ),
            CustomCards(
              'Black Tea',
              () => {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => menuOptions(
                        tea_price[1], 'images/black-tea.jpg', 'Black Tea'),
                  ),
                ),
              },
            ),
            CustomCards(
              'Herbal Tea',
              () => {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => menuOptions(
                        tea_price[2], 'images/htea.jpeg', 'Herbal Tea'),
                  ),
                ),
              },
            ),
            CustomCards(
              'Green Tea',
              () => {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => menuOptions(
                        tea_price[3], 'images/greentea.jpg', 'Green Tea'),
                  ),
                ),
              },
            ),
            CustomCards(
              'Fermented Tea',
              () => {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => menuOptions(
                        tea_price[5], 'images/fermented-tea.jpg', 'Fermented Tea'),
                  ),
                ),
              },
            ),
            CustomCards(
              'Yellow Tea',
              () => {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => menuOptions(
                        tea_price[5], 'images/yellow-tea.jpg', 'Yellow Tea'),
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
