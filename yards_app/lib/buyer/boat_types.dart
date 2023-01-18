// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:yards_app/custom_widgets/custom_options.dart';

import '../boat-types/boats.dart';

class BoatTypes extends StatefulWidget {
  const BoatTypes({
    super.key,
    this.title,
    this.boatTypes,
    this.destinationOrCategory,
  });
  final String? title;
  final List? boatTypes;
  final List? destinationOrCategory;

  @override
  State<BoatTypes> createState() => _BoatTypesState();
}

class _BoatTypesState extends State<BoatTypes> {
  List boatImages = [
    'assets/images/speed-boat.jpg',
    'assets/images/watersports.jpg',
    'assets/images/fishing-boats.jpg',
    'assets/images/sailing.jpg',
    'assets/images/luxury.jpg',
    'assets/images/cruise-ships.png',
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
          widget.title!,
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
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemCount: widget.destinationOrCategory!.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: CustomOptions(
                text: widget.destinationOrCategory![index],
                imagepath: boatImages[index],
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => boatsScreen(
                          boatType: widget.destinationOrCategory![index]),
                    ),
                  );
                },
                textcolor: Color(0xFF163257),
                borderColor: Color(0xFF163257),
                backgroundColor: Colors.white,
              ),
            );
            // return Padding(
            //   padding: const EdgeInsets.all(3.0),
            //   child: Image.file(
            //     File(
            //       imageFileList![index].path,
            //     ),
            //     fit: BoxFit.cover,
            //   ),
            // );
          },
        ),
      ),
    );
  }
}
