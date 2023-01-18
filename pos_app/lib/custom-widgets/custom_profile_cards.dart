// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyCards extends StatelessWidget {
  const MyCards({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {},
      child: SizedBox(
        width: width / 1.05,
        height: height / 13,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          color: Colors.white,
          elevation: 2.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                Icons.person,
                color: Color.fromARGB(255, 115, 191, 67),
              ),
              Text(
                'Dummy Card',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: width / 3),
              Icon(
                Icons.arrow_forward_ios,
                color: Color.fromARGB(255, 115, 191, 67),
                size: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
