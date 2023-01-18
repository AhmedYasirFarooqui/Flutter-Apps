import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    this.hinttext,
    this.controller,
    this.isObscure = true,
    required this.customValidator,
  }) : super(key: key);

  final String? hinttext;
  final String? Function(String?) customValidator;
  final TextEditingController? controller;
  final bool isObscure;

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final double _width = 1.5;
  final double _radius = 12.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        borderRadius: BorderRadius.circular(_radius),
        elevation: 3.0,
        shadowColor: Colors.blue[800],
        child: TextFormField(
          obscureText: widget.isObscure,
          controller: widget.controller,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: _width,
                color: Colors.white,
              ),
              borderRadius: BorderRadius.circular(_radius),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: _width,
                color: Colors.white,
              ),
              borderRadius: BorderRadius.circular(_radius),
            ),
            hintText: widget.hinttext,
          ),
          validator: widget.customValidator,
        ),
      ),
    );
  }
}
