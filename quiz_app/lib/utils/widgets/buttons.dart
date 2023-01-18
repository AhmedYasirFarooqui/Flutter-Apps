// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:quiz_app/utils/colors.dart';

class CustomButtons extends StatelessWidget {
  final VoidCallback? onTap;
  final Color? buttonColor;
  final Color? textColor;
  final String? text;
  final double? width;
  final double? height;
  const CustomButtons({
    super.key,
    required this.onTap,
    required this.buttonColor,
    this.width,
    this.height,
    required this.textColor,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15.0),
        decoration: BoxDecoration(
          color: buttonColor ?? AppColors.lightGreen,
          borderRadius: BorderRadius.circular(8),
        ),
        height: height,
        child: Center(
          child: Text(
            text ?? '',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: textColor ?? AppColors.white,
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    );
  }
}

class SocialSignInButtons extends StatelessWidget {
  const SocialSignInButtons({
    super.key,
    this.image,
    this.onTap,
  });
  final String? image;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: onTap,
      child: CircleAvatar(
        radius: 30,
        backgroundColor: AppColors.white,
        child: Center(
          child: SizedBox(
            width: width * 0.13,
            child: Image(
              image: AssetImage(image!),
              width: 40.0,
              height: 40.0,
            ),
          ),
        ),
      ),
    );
  }
}
