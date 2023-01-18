import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:favorite_button/favorite_button.dart';

// ignore: must_be_immutable, camel_case_types
class menuOptions extends StatefulWidget {
  // ignore: non_constant_identifier_names
  double price;
  final String imgPath;
  final String name;
  menuOptions(this.price, this.imgPath, this.name);
  @override
  _menuOptionsState createState() => _menuOptionsState();
}

// ignore: camel_case_types
class _menuOptionsState extends State<menuOptions> {
  double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;
  // ignore: non_constant_identifier_names
  int _count = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.brown[200],
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40.0),
                      bottomRight: Radius.circular(40.0),
                    ),
                    child: Image(
                      image: AssetImage(widget.imgPath),
                      fit: BoxFit.cover,
                      height: deviceHeight(context) * 0.4,
                    ),
                  ),
                ),
                SafeArea(
                  child: IconButton(
                    //back button on upper left corner
                    icon: Icon(FontAwesomeIcons.arrowLeft, color: Colors.white),
                    iconSize: 20.0,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15.0,
            ),
            Container(
              //margin: EdgeInsets.only(right: 120.0),
              child: Text(
                widget.name,
                style: TextStyle(
                  fontSize: 30.0,
                  fontFamily: 'Pacifico',
                  color: Colors.brown[800],
                ),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Divider(
              color: Colors.grey[600],
              indent: 20.0,
              endIndent: 20.0,
            ),
            Column(
              children: [
                Container(
                  //margin: EdgeInsets.only(right: 250.0),
                  child: Row(
                    children: [
                      Container(
                        child: Text(
                          'Description',
                          //textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.brown[800],
                            fontFamily: 'Pacifico',
                          ),
                        ),
                        margin: EdgeInsets.only(left: 8.0),
                      ),
                      Container(
                        child: FavoriteButton(
                          isFavorite: false,
                          valueChanged: (_isFavorite) {
                            print('Is Favorite : $_isFavorite');
                          },
                        ),
                        margin: EdgeInsets.only(left: 180.0),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 0.0),
                  child: Text(
                    '\nAn easy and flavoured caffeine beverage made with fresh and nutritious ingredients from the most natural origins.'
                    '\n\nThroughout the whole world, this beverage is traditionally'
                    ' consumed in the morning, usually as part of breakfast, often in the evening with snacks.',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontFamily: 'Josefin',
                        fontWeight: FontWeight.w900),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25.0,
            ),
            Column(
              children: [
                Text(
                  "Price: \$${widget.price}",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Josefin',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(60.0),
                      ),
                      height: 60.0,
                      width: 140.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  _count++;
                                });
                              },
                              icon: Icon(Icons.add)
                              //size: 40.0,
                              ),
                          Text(
                            '$_count',
                            style: TextStyle(fontSize: 20.0),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                _count > 1 ? _count-- : _count = 1;
                              });
                            },
                            icon: Icon(Icons.remove),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        _myAlertDialog(widget.price);
                      },
                      splashColor: Colors.brown,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60.0),
                          color: Colors.brown,
                        ),
                        height: 60.0,
                        width: 140.0,
                        child: Center(
                          child: Text(
                            'Order Now',
                            style: TextStyle(
                              fontSize: 22.0,
                              fontFamily: 'Pacifico',
                              color: Colors.white,
                            ),
                          ),
                        ),
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

  Future<void> _myAlertDialog(double price) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
            child: Text(
              'Thank you for choosing!',
              style: TextStyle(fontFamily: 'Pacifico'),
            ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Center(
                  child: Text(
                    'Your order has been placed!\n',
                    style: TextStyle(
                      fontFamily: 'Josefin',
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    'Avg Time: 15:00 min',
                    style: TextStyle(
                      fontFamily: 'Josefin',
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    'Price:  \$${widget.price}',
                    style: TextStyle(
                      fontFamily: 'Josefin',
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text(
                'Ok',
                style: TextStyle(
                    fontFamily: 'Josefin',
                    fontSize: 18.0,
                    fontWeight: FontWeight.w900,
                    color: Colors.black),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
