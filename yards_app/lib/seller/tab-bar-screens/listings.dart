// ignore_for_file: unused_local_variable, prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yards_app/seller/listings/add_images.dart';
import 'package:yards_app/seller/listings/add_location.dart';
import 'package:group_button/group_button.dart';
import '../../custom_widgets/custom_buttons.dart';
import '../../custom_widgets/custom_search_bar.dart';
import '../listings/add_details.dart';
import '../listings/start.dart';

class ListingsScreen extends StatefulWidget {
  const ListingsScreen({super.key});

  @override
  State<ListingsScreen> createState() => _ListingsScreenState();
}

class _ListingsScreenState extends State<ListingsScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: height / 30.0),
          const Text(
            'Search your listings',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
              color: Color(0xFF163257),
            ),
          ),
          SizedBox(height: height / 120.0),
          CustomSearchBar(
            icon: Icons.search,
            hinttext: 'Search Listings...',
          ),
          SizedBox(height: height / 8),
          Icon(FontAwesomeIcons.store),
          SizedBox(height: height / 130),
          const Text(
            'No listings to show yet',
            style: TextStyle(
              fontSize: 16.0,
              color: Color(0xFF163257),
            ),
          ),
          SizedBox(height: height / 130),
          const Text(
            'Create a listing to start selling',
            style: TextStyle(
              fontSize: 16.0,
              color: Color(0xFF163257),
            ),
          ),
          SizedBox(height: height / 110),
          Buttons(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => StartScreen(),
                ),
              );
            },
            text: 'Create Listing',
            textcolor: Colors.white,
            buttoncolor: Color(0xFF163257),
          )
        ],
      ),
    );
  }
}
