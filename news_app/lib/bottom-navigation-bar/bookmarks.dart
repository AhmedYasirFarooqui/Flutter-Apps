// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class BookmarksScreen extends StatefulWidget {
  const BookmarksScreen({Key? key}) : super(key: key);

  @override
  _BookmarksScreenState createState() => _BookmarksScreenState();
}

class _BookmarksScreenState extends State<BookmarksScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 180.0,
            ),
            Image(
              image: AssetImage('assets/images/list.png'),
              color: Color(0xffb02121),
              width: 70.0,
              height: 70.0,
            ),
            Text(
              'Nothing to read.',
              style: TextStyle(
                fontSize: 18.0,
                color: Color(0xffb02121),
                fontFamily: 'ZillaSlab',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
