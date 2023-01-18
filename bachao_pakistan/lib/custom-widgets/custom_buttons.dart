// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CustomButtons extends StatefulWidget {
  const CustomButtons({
    super.key,
    this.text,
    this.onPressed,
  });
  final String? text;
  final VoidCallback? onPressed;

  @override
  State<CustomButtons> createState() => _CustomButtonsState();
}

class _CustomButtonsState extends State<CustomButtons> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width / 2,
      height: height / 16,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFA1DD70),
          elevation: 0.0,
        ),
        onPressed: widget.onPressed,
        child: Text(
          widget.text!,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontFamily: 'Lato',
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }
}
