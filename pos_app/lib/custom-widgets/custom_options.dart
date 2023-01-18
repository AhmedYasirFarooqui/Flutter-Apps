// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CustomOptions extends StatelessWidget {
  const CustomOptions({super.key, this.text, this.onTap});
  final String? text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width / 2.5,
      height: height / 7.0,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 115, 191, 67),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        onPressed: onTap,
        child: Text(
          text.toString(),
          style: const TextStyle(
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}
