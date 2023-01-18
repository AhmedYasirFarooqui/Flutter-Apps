// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  const Buttons({
    super.key,
    this.onPressed,
    this.text,
    this.buttoncolor,
    this.textcolor,
  });
  final VoidCallback? onPressed;
  final String? text;
  final Color? buttoncolor;
  final Color? textcolor;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return TextButton(
      onPressed: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: buttoncolor,
        ),
        width: width / 1.2,
        height: height / 15,
        child: Center(
          child: Text(
            text!,
            style: TextStyle(
              fontSize: 17.0,
              color: textcolor,
            ),
          ),
        ),
      ),
    );
  }
}
