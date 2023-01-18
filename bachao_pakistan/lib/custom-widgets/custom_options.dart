// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CustomOptions extends StatefulWidget {
  const CustomOptions({
    super.key,
    required this.text,
    required this.width,
    required this.onTap,
  });
  final String text;
  final double width;
  final VoidCallback onTap;

  @override
  State<CustomOptions> createState() => _CustomOptionsState();
}

class _CustomOptionsState extends State<CustomOptions> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        width: width / 1.07,
        height: height / 17,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Color(0xFF207dff),
        ),
        child: Center(
          child: Row(
            children: [
              SizedBox(width: width / 30),
              Text(
                widget.text,
                style: TextStyle(
                  color: Colors.white,
                  // fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                  decoration: TextDecoration.none,
                ),
              ),
              SizedBox(width: width / widget.width),
              InkWell(
                onTap: widget.onTap,
                child: Icon(
                  Icons.arrow_forward,
                  size: 22.0,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
