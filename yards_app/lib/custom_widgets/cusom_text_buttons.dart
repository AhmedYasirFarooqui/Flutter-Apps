import 'package:flutter/material.dart';

class CustomTextButtons extends StatelessWidget {
  const CustomTextButtons({
    super.key,
    this.text,
    required this.onPressed,
    this.color,
  });
  final String? text;
  final VoidCallback onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text!,
        style: TextStyle(
          fontSize: 15.0,
          color: color,
        ),
      ),
    );
  }
}
