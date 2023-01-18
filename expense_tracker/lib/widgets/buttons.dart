// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Buttons extends StatelessWidget {
  const Buttons({
    Key? key,
    this.buttonText,
    this.onPressed,
    this.color,
    this.textColor,
  }) : super(key: key);
  final String? buttonText;
  final Color? color;
  final Color? textColor;
  final onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      onPressed: onPressed,
      child: SizedBox(
        width: Get.width * 0.16,
        child: Center(
          child: Text(
            buttonText!,
            style: TextStyle(
              fontSize: 14,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
