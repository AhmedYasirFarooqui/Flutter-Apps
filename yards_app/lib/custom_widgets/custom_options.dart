// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CustomOptions extends StatelessWidget {
  const CustomOptions({
    super.key,
    this.text,
    this.onPressed,
    this.backgroundColor,
    this.borderColor,
    this.textcolor,
    this.imagepath,
  });
  final String? text;
  final VoidCallback? onPressed;
  final String? imagepath;
  final Color? textcolor;
  final Color? borderColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 3.0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagepath!),
            opacity: 0.5,
            fit: BoxFit.cover,
          ),
          color: backgroundColor,
          border: Border.all(color: borderColor!),
          borderRadius: BorderRadius.circular(8.0),
        ),
        width: width / 3,
        height: height / 7,
        child: Center(
          child: Text(
            text!,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              color: textcolor!,
            ),
          ),
        ),
      ),
    );
  }
}
