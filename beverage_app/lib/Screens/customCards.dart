import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class CustomCards extends StatelessWidget {
  final _fontFamily = 'Pacifico';
  final _color = Colors.brown[900];
  final _fontSize = 25.0;
  //final _aspectRatio = 1 / 1;
  // ignore: non_constant_identifier_names
  String _Text;
  Function onTap;

  CustomCards(this._Text, this.onTap);
  double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.17),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(50.0),
          color: Colors.brown[400],
        ),
        width: deviceWidth(context) * 0.7,
        height: deviceHeight(context) * 0.12,
        child: Center(
          child: Text(
            _Text,
            style: TextStyle(
                fontFamily: _fontFamily, color: _color, fontSize: _fontSize),
          ),
        ),
      ),
    );
  }
}