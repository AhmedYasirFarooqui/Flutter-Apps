// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import '../../custom_widgets/another_custom_search_bar.dart';

class AddDetailsScreen extends StatefulWidget {
  const AddDetailsScreen({super.key});

  @override
  State<AddDetailsScreen> createState() => _AddDetailsScreenState();
}

class _AddDetailsScreenState extends State<AddDetailsScreen> {
  final List<String> categories = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];

  final List<String> condition = [
    'tem1',
    'tem2',
    'tem3',
    'tem4',
  ];
  String? selectedCategory = 'Item1';
  String? selectedCondition = 'tem1';
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: height / 20),
          Padding(
            padding: EdgeInsets.only(right: height * 0.29),
            child: const Text(
              'Product Name',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF163257),
              ),
            ),
          ),
          AnotherCustomSearchBar(hinttext: 'e.g. My Boat'),
          SizedBox(height: height / 30),
          Padding(
            padding: EdgeInsets.only(right: height * 0.34),
            child: const Text(
              'Category',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF163257),
              ),
            ),
          ),
          DropdownButton2(
            buttonWidth: width / 1.1,
            hint: Text(
              'Choose Category...',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            value: selectedCategory!,
            items: categories
                .map(
                  (category) => DropdownMenuItem<String>(
                    value: category,
                    child: Text(
                      category,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                )
                .toList(),
            onChanged: (value) {
              setState(
                () {
                  selectedCategory = value;
                },
              );
            },
          ),
          // AnotherCustomSearchBar(hinttext: 'Choose Category...'),
          SizedBox(height: height / 30),
          Padding(
            padding: EdgeInsets.only(right: height * 0.33),
            child: const Text(
              'Condition',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF163257),
              ),
            ),
          ),
          DropdownButton2(
            buttonWidth: width / 1.1,
            hint: Text(
              'Choose Condition...',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            value: selectedCondition!,
            items: condition
                .map(
                  (con) => DropdownMenuItem<String>(
                    value: con,
                    child: Text(
                      con,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                )
                .toList(),
            onChanged: (value) {
              setState(
                () {
                  selectedCondition = value;
                },
              );
            },
          ),
          // AnotherCustomSearchBar(hinttext: 'Choose Condition...'),
          SizedBox(height: height / 30),
          Padding(
            padding: EdgeInsets.only(right: height * 0.315),
            child: const Text(
              'Description',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF163257),
              ),
            ),
          ),
          AnotherCustomSearchBar(hinttext: 'add description...'),
          SizedBox(height: height / 30),
          Padding(
            padding: EdgeInsets.only(right: height * 0.37),
            child: const Text(
              'Price',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF163257),
              ),
            ),
          ),
          AnotherCustomSearchBar(hinttext: 'Enter Price...'),
        ],
      ),
    );
  }
}
