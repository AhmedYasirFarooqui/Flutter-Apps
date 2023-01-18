// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key, this.icon, this.hinttext});
  final IconData? icon;
  final String? hinttext;

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 22.0, right: 40.0),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(top: 16.0, right: 15.0),
            child: IconTheme(
              data: IconThemeData(
                color: Colors.grey,
              ),
              child: Icon(widget.icon),
            ),
          ),
          prefixIconColor: Colors.grey,
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFF163257),
            ),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          hintText: widget.hinttext,
        ),
      ),
    );
  }
}
