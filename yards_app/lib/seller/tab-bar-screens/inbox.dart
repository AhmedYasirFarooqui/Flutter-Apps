// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, unused_local_variable

import 'package:flutter/material.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({super.key});

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            InkWell(
              onTap: () {},
              child: Card(
                child: Container(
                  color: Color(0xff87CEEB),
                  child: ListTile(
                    title: Text('New Buyer Request'),
                    subtitle: Text('19 Aug'),
                    trailing: Text('3:03 '),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Card(
                child: Container(
                  color: Color(0xff87CEEB),
                  child: ListTile(
                    title: Text('New Buyer Request'),
                    subtitle: Text('19 Aug'),
                    trailing: Text('3:03 '),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Card(
                child: Container(
                  color: Color(0xff87CEEB),
                  child: ListTile(
                    title: Text('New Buyer Request'),
                    subtitle: Text('19 Aug'),
                    trailing: Text('3:03 '),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
