// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class DashboardButtons extends StatefulWidget {
  const DashboardButtons({
    super.key,
    this.text,
    this.onTap,
  });
  final String? text;
  final VoidCallback? onTap;

  @override
  State<DashboardButtons> createState() => _DashboardButtonsState();
}

class _DashboardButtonsState extends State<DashboardButtons> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        width: width / 3,
        height: height / 20,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
            color: Color(0xFF207dff),
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Text(
            widget.text!,
            style: TextStyle(
              color: Color(0xFF207dff),
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.none,
            ),
          ),
        ),
      ),
    );
  }
}
