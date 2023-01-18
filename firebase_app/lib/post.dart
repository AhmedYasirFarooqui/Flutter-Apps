import 'package:flutter/material.dart';

class Post extends StatelessWidget {
  final Map data;

  Post(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: SafeArea(
        child: Column(
          children: [
            Image.network(
              data["url"],
              width: 300.0,
              height: 100.0,
            ),
            Text(data["title"]),
            Text(data["description"]),
          ],
        ),
      ),
    );
  }
}
