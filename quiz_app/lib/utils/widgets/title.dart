import 'package:flutter/material.dart';
import 'package:quiz_app/utils/colors.dart';

class TitleOrDescription extends StatelessWidget {
  const TitleOrDescription({
    super.key,
    required this.text,
    required this.fontSize,
  });
  final String text;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: AppColors.white,
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
