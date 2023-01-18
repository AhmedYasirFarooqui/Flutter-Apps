// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AnotherCustomSearchBar extends StatefulWidget {
  const AnotherCustomSearchBar({super.key, this.hinttext});
  final String? hinttext;

  @override
  State<AnotherCustomSearchBar> createState() => _AnotherCustomSearchBarState();
}

class _AnotherCustomSearchBarState extends State<AnotherCustomSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: TextField(
        cursorColor: Colors.grey,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 10.0),
          // prefixIcon: Padding(
          //   padding: const EdgeInsets.only(top: 16.0, right: 15.0),
          //   child: IconTheme(
          //     data: IconThemeData(
          //       color: Colors.grey,
          //     ),
          //     child: Icon(widget.icon),
          //   ),
          // ),
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
          hintStyle: TextStyle(color: Colors.grey),
          hintText: widget.hinttext,
        ),
      ),
    );
  }
}
