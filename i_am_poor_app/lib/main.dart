import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(
          child: Text("I Am Poor"),
        ),
        backgroundColor: Colors.blue[800],
      ),
      body: Center(
        child: Image(
          image: AssetImage("images/coal.jpg"),
        ),
      ),
    ),
  ));
}
