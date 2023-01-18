// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:yards_app/boat-types/boats.dart';

import '../buyer/boat_types.dart';
import '../custom_widgets/custom_options.dart';
import '../custom_widgets/custom_search_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // String path = 'assets/images';

  List boatImages = [
    'assets/images/speed-boat.jpg',
    'assets/images/watersports.jpg',
    'assets/images/fishing-boats.jpg',
    'assets/images/sailing.jpg',
    'assets/images/luxury.jpg',
    'assets/images/cruise-ships.png',
  ];

  List boatsImages = [
    'assets/images/speed-boat.jpg',
    'assets/images/watersports.jpg',
    'assets/images/fishing-boats.jpg',
    'assets/images/sailing.jpg',
    'assets/images/luxury.jpg',
    'assets/images/cruise-ships.png',
  ];

  List boatTypes = [
    'Powerboats',
    'Water Sports',
    'Fishing',
    'Sailing',
    'Luxury/Events',
    'Ferries/Cruises',
  ];
  List popularDestinations = [
    'The World Islands',
    'Burj Al Arab',
    'Nikki Beach',
    'Russian Beach',
    'Manora Island',
    'Bundle Island',
  ];
  List popularRides = [
    'Guided Jet Ski Ride',
    'Guided Driving Trips',
    'Speed Boat',
    'Yatch Sailing',
    'Water Sports',
    'Criuses',
  ];

  List title = [
    'Popular Destinations',
    'Popular Rides',
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
        title: const Text(
          'Boat Yard',
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        elevation: 0.0,
        actions: [
          TextButton(
            child: const Text(
              'Sell',
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/anchor-repeat.jpg'),
              repeat: ImageRepeat.noRepeat,
              scale: 2.0,
              opacity: 0.1,
              fit: BoxFit.cover,
            ),
          ),
          width: width,
          height: height / 1.15,
          child: Column(
            children: [
              SizedBox(height: height / 35.0),
              const Text(
                'Planning to go on a trip?',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF163257),
                ),
              ),
              SizedBox(height: height / 90.0),
              const Text(
                'Start searching for your dream boat',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF163257),
                ),
              ),
              SizedBox(height: height / 120.0),
              CustomSearchBar(
                icon: Icons.search,
                hinttext: 'Search destinations...',
              ),
              SizedBox(height: height / 25.0),
              Padding(
                padding: EdgeInsets.only(right: width / 1.7),
                child: const Text(
                  'Browse by type',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF163257),
                  ),
                ),
              ),
              SizedBox(height: height / 75.0),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Wrap(
                  children: List.generate(
                    boatTypes.length,
                    (index) {
                      return CustomOptions(
                        text: boatTypes[index],
                        imagepath: boatImages[index],
                        onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                boatsScreen(boatType: boatTypes[index]),
                          ),
                        ),
                        textcolor: Colors.white,
                        backgroundColor: Color(0xFF163257),
                        borderColor: Colors.transparent,
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: height / 25.0),
              Row(
                children: [
                  SizedBox(width: width / 30),
                  Text(
                    title[0],
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF163257),
                    ),
                  ),
                  SizedBox(width: width / 3.45),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => BoatTypes(
                            title: title[0],
                            boatTypes: boatTypes,
                            destinationOrCategory: popularDestinations,
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      'See All',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF163257),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height / 75.0),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Wrap(
                  children: List.generate(
                    popularDestinations.length,
                    (index) {
                      return CustomOptions(
                        text: popularDestinations[index],
                        imagepath: boatImages[index],
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => BoatTypes(
                                title: title[0],
                                boatTypes: boatTypes,
                                destinationOrCategory: popularDestinations,
                              ),
                            ),
                          );
                        },
                        textcolor: Color(0xFF163257),
                        borderColor: Color(0xFF163257),
                        backgroundColor: Colors.white,
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: height / 25.0),
              Row(
                children: [
                  SizedBox(width: width / 30),
                  Text(
                    title[1],
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF163257),
                    ),
                  ),
                  SizedBox(width: width / 2.2),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => BoatTypes(
                            title: title[1],
                            boatTypes: boatTypes,
                            destinationOrCategory: popularRides,
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      'See All',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF163257),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height / 75.0),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Wrap(
                  children: List.generate(
                    popularRides.length,
                    (index) {
                      return CustomOptions(
                        text: popularRides[index],
                        imagepath: boatsImages[index],
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  boatsScreen(boatType: popularRides[index]),
                            ),
                          );
                        },
                        textcolor: Color(0xFF163257),
                        borderColor: Color(0xFF163257),
                        backgroundColor: Colors.white,
                      );
                    },
                  ),
                ),
              ),
              // SizedBox(height: 10.0),
            ],
          ),
        ),
      ),
    );
  }
}
