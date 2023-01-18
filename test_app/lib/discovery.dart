// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class discoveryPage extends StatefulWidget {
  const discoveryPage({Key? key}) : super(key: key);

  @override
  State<discoveryPage> createState() => _discoveryPageState();
}

class _discoveryPageState extends State<discoveryPage> {
  double elevation = 1.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        primary: false,
        // padding: const EdgeInsets.all(20),
        crossAxisSpacing: 5,
        mainAxisSpacing: 20,
        crossAxisCount: 2,
        children: <Widget>[
          Options(
            imgPath: 'assets/images/beer.png',
            text1: 'Bars and Hotels',
            text2: '42 Places',
          ),
          Options(
            imgPath: 'assets/images/dine.png',
            text1: 'Fine Dining',
            text2: '15 Places',
          ),
          Options(
            imgPath: 'assets/images/cafe.png',
            text1: 'cafes',
            text2: '28 Places',
          ),
          Options(
            imgPath: 'assets/images/track.png',
            text1: 'Nearby',
            text2: '34 Places',
          ),
          Options(
            imgPath: 'assets/images/fast-food.png',
            text1: 'Fast Food',
            text2: '29 Places',
          ),
          Options(
            imgPath: 'assets/images/pizza.png',
            text1: 'Featured Foods',
            text2: '21 Places',
          ),
        ],
      ),
    );
  }
}

class Options extends StatefulWidget {
  const Options({Key? key, this.imgPath, this.text1, this.text2})
      : super(key: key);
  final String? imgPath;
  final String? text1;
  final String? text2;

  @override
  State<Options> createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Card(
          child: Column(
            children: [
              Image(
                image: AssetImage(widget.imgPath!),
                width: 110.0,
                height: 110.0,
              ),
              Text(
                widget.text1!,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                widget.text2!,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 13.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
