import 'package:flutter/material.dart';

class Buttons extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const Buttons(
      {this.bwidth,
      this.bheight,
      this.text,
      this.textcolor,
      this.bcolor,
      this.onPressed});

  final double? bwidth;
  final double? bheight;
  final String? text;
  final Color? textcolor;
  final Color? bcolor;
  final VoidCallback? onPressed;

  @override
  _ButtonsState createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      width: widget.bwidth,
      height: widget.bheight,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          primary: widget.bcolor,
        ),
        onPressed: widget.onPressed,
        child: Text(widget.text.toString(),
            style: TextStyle(
              color: widget.textcolor,
              fontSize: 18.0,
            )),
      ),
    );
  }
}
