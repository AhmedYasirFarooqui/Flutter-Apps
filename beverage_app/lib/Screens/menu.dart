import '../Screens/menuOptions/coffee.dart';
import '../Screens/menuOptions/tea.dart';
import '../Screens/menuOptions/breakfast.dart';
import '../Screens/menuOptions/sandwiches.dart';
import '../Screens/menuOptions/soup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
/*import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';*/
import 'dart:ui';

import 'customCards.dart';

// ignore: camel_case_types
class menuScreen extends StatelessWidget {
  final _fontFamily = 'Pacifico';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[200],
      drawer: Drawer(
        child: Container(
          color: Colors.brown[200],
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage('images/ncot.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 50.0,
                        backgroundColor: Colors.black,
                        child: FlutterLogo(
                          size: 50,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Ahmed Yasir',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontFamily: 'Josefin',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              CustomListTile(Icons.account_box, 'Profile', () => {}),
              CustomListTile(Icons.description, 'My Orders', () => {}),
              CustomListTile(Icons.star, 'Rate App', () => {}),
              CustomListTile(Icons.share, 'Share App', () => {}),
              CustomListTile(Icons.notes, 'Licenses', () => {}),
              SizedBox(height: 45.0),
              Divider(color: Colors.brown, indent: 10, endIndent: 10),
              Container(
                margin: EdgeInsets.only(left: 60.0),
                child: Text(
                  'Developed by: Ahmed Yasir Farooqui',
                  style: TextStyle(
                      fontSize: 12.0,
                      fontFamily: _fontFamily,
                      color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          CustomPopUpMenu(),
        ],
        title: Text(
          'Menu',
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontFamily: _fontFamily),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomCards(
                'Coffee',
                () => {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CoffeeScreen()))
                    }),
            CustomCards(
                'Tea',
                () => {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => teaScreen()))
                    }),
            CustomCards(
                'Breakfast',
                () => {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => breakfastScreen()))
                    }),
            CustomCards(
                'Sandwiches',
                () => {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => sandwhichScreen()))
                    }),
            CustomCards(
                'Soup',
                () => {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => soupScreen()))
                    }),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomListTile extends StatelessWidget {
  IconData icon;
  String text;
  Function onTap;

  CustomListTile(this.icon, this.text, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      child: Container(
        child: InkWell(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(icon),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                    child: Text(
                      text,
                      style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'Josefin',
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Icon(Icons.arrow_right),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable

enum MenuOption { About, Coupons, Reciept, Feedback, Logout }

class CustomPopUpMenu extends StatelessWidget {
  _onSelect(MenuOption option) {
    switch (option) {
      case MenuOption.About:
        // ignore: missing_return
        break;
      case MenuOption.Coupons:
        // ignore: todo
        // TODO: Handle this case.
        break;
      case MenuOption.Reciept:
        // ignore: todo
        // TODO: Handle this case.
        break;
      case MenuOption.Feedback:
        // ignore: todo
        // TODO: Handle this case.
        break;
      case MenuOption.Logout:
        // ignore: todo
        // TODO: Handle this case.
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<MenuOption>(
      color: Colors.white,
      onSelected: _onSelect,
      itemBuilder: (BuildContext context) {
        return <PopupMenuEntry<MenuOption>>[
          PopupMenuItem(
              child: Text(
                'About',
                style: TextStyle(
                    color: Colors.black38,
                    fontFamily: 'Josefin',
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ),
              value: MenuOption.About),
          PopupMenuItem(
              child: Text(
                'Coupons',
                style: TextStyle(
                    color: Colors.black38,
                    fontFamily: 'Josefin',
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ),
              value: MenuOption.Coupons),
          PopupMenuItem(
              child: Text(
                'Reciept',
                style: TextStyle(
                    color: Colors.black38,
                    fontFamily: 'Josefin',
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ),
              value: MenuOption.Reciept),
          PopupMenuItem(
              child: Text(
                'Feedback',
                style: TextStyle(
                    color: Colors.black38,
                    fontFamily: 'Josefin',
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ),
              value: MenuOption.Feedback),
          PopupMenuItem(
              child: Text(
                'Logout',
                style: TextStyle(
                    color: Colors.black38,
                    fontFamily: 'Josefin',
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ),
              value: MenuOption.Logout),
        ];
      },
    );
  }
}
