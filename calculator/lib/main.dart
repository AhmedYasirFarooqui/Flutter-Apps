import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

// ignore: non_constant_identifier_names
Widget CustomButton(String _text, Color _color, Color _btnclr) {
  return ElevatedButton(
    child: Text(
      _text,
      style: TextStyle(color: _color, fontSize: 25.0, fontFamily: 'Lato'),
    ),
    onPressed: () => {},
    style: ElevatedButton.styleFrom(
      elevation: 8.0,
      primary: _btnclr,
      minimumSize: Size(75, 75),
      padding: EdgeInsets.symmetric(horizontal: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15.0),
        ),
      ),
    ),
  );
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: 180.0,
              ),
              Text(
                '0',
                style: TextStyle(
                  decoration: TextDecoration.none,
                  fontFamily: 'Lato',
                  fontSize: 50.0,
                  color: Colors.blueGrey,
                  //fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Divider(
                color: Colors.black,
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton('7', Colors.black, Colors.grey[200]),
                  CustomButton('8', Colors.black, Colors.grey[200]),
                  CustomButton('9', Colors.black, Colors.grey[200]),
                  CustomButton('-', Colors.grey[200], Colors.blueGrey),
                ],
              ),
              SizedBox(height: 25.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton('4', Colors.black, Colors.grey[200]),
                  CustomButton('5', Colors.black, Colors.grey[200]),
                  CustomButton('6', Colors.black, Colors.grey[200]),
                  CustomButton('/', Colors.grey[200], Colors.blueGrey),
                ],
              ),
              SizedBox(height: 25.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton('1', Colors.black, Colors.grey[200]),
                  CustomButton('2', Colors.black, Colors.grey[200]),
                  CustomButton('3', Colors.black, Colors.grey[200]),
                  CustomButton('*', Colors.grey[200], Colors.blueGrey),
                ],
              ),
              SizedBox(height: 25.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton('0', Colors.black, Colors.grey[200]),
                  CustomButton('.', Colors.black, Colors.grey[200]),
                  CustomButton('=', Colors.black, Colors.grey[200]),
                  CustomButton('+', Colors.grey[200], Colors.blueGrey),
                ],
              ),
              SizedBox(height: 25.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton('C', Colors.blueGrey, Colors.grey[200]),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
