import 'package:flutter/material.dart';
import 'package:quiz_app/utils/colors.dart';

class QuizTopicContainer extends StatelessWidget {
  const QuizTopicContainer({
    super.key,
    required this.image,
    required this.onPressed,
  });
  final String image;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightGreen,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
            backgroundColor: AppColors.white,
            radius: 50.0,
            child: Image(
              image: AssetImage(image),
              width: 70,
            ),
          ),
          const Text(
            '0 Points',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: AppColors.white,
            ),
            onPressed: onPressed,
            child: const Text(
              'Start',
              style: TextStyle(
                color: AppColors.lightGreen,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
