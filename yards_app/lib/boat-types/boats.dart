// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, unused_local_variable, prefer_const_literals_to_create_immutables, unused_import, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:yards_app/boats_information.dart';

class boatsScreen extends StatefulWidget {
  const boatsScreen({super.key, this.boatType});
  final String? boatType;

  @override
  State<boatsScreen> createState() => _boatsScreenState();
}

class _boatsScreenState extends State<boatsScreen> {
  double? myRating;
  double? initialRating = 5;

  List<Map>? details = [
    {
      'price': '\$2000',
      'capacities': '2 Guests',
      'name': 'Pearl 95',
      'locations': 'Port Qasim, Karachi',
      'modal': '2007',
      'image': 'assets/images/sail.jpg',
      'captain': 'Mudassir Rahim',
    },
    {
      'price': '\$3000',
      'capacities': '5 Guests',
      'name': 'Jaguar 27',
      'locations': 'Gawadar, Balochistan',
      'modal': '2009',
      'image': 'assets/images/speed-boat.jpg',
      'captain': 'Qasim Zaidi',
    },
    {
      'price': '\$5000',
      'capacities': '3 Guests',
      'name': 'Williams TurboJet 285',
      'locations': 'Maripur, Karachi',
      'modal': '2015',
      'image': 'assets/images/cruise-ships.png',
      'captain': 'Hamza',
    },
    {
      'price': '\$8000',
      'capacities': '6 Guests',
      'name': 'Glastron GS249',
      'locations': 'China Port, Karachi',
      'modal': '2017',
      'image': 'assets/images/yatch.jpg',
      'captain': 'Yasir',
    },
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 70.0,
        backgroundColor: const Color(0xFF163257),
        centerTitle: true,
        title: Text(
          widget.boatType!,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        elevation: 0.0,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/anchor-repeat.jpg'),
            repeat: ImageRepeat.noRepeat,
            opacity: 0.1,
            fit: BoxFit.cover,
          ),
        ),
        width: width,
        height: height,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: details!.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                setState(
                  () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => BoatsInformation(
                          name: details![index]['name'],
                          modal: details![index]['modal'],
                          price: details![index]['price'],
                          location: details![index]['locations'],
                          image: details![index]['image'],
                          captain: details![index]['captain'],
                        ),
                      ),
                    );
                  },
                );
              },
              child: Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3.0),
                ),
                child: Column(
                  children: [
                    Container(
                      width: width,
                      height: height / 8,
                      child: Image(
                        image: AssetImage(details![index]['image']),
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: height / 120),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RatingBar(
                          glowColor: Colors.white,
                          initialRating: initialRating!,
                          direction: Axis.horizontal,
                          updateOnDrag: true,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 15.0,
                          ratingWidget: RatingWidget(
                            full: Icon(Icons.star, color: Colors.yellow[600]),
                            half: Icon(Icons.star_half,
                                color: Colors.yellow[600]),
                            empty: Icon(Icons.star_border,
                                color: Colors.yellow[600]),
                          ),
                          // itemPadding: EdgeInsets.symmetric(horizontal: 10.0),
                          onRatingUpdate: (rating) {
                            setState(() {
                              myRating = rating;
                            });
                          },
                        ),
                        SizedBox(width: width / 5.5),
                        Text(
                          myRating != null
                              ? myRating.toString()
                              : initialRating.toString(),
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height / 80),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: width / 120),
                        Text(
                          details![index]['price'],
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: width / 4.8),
                        Text(
                          details![index]['capacities'],
                          style: TextStyle(
                            fontSize: 12.0,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height / 60),
                    Padding(
                      padding: EdgeInsets.only(right: height * 0.167),
                      child: Text(
                        details![index]['modal'],
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
