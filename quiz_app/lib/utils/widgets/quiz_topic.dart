import 'package:flutter/material.dart';
import 'package:quiz_app/utils/colors.dart';

class QuizTopicContainer extends StatelessWidget {
  const QuizTopicContainer({
    super.key,
    required this.topic,
    required this.onPressed,
  });
  final String topic;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.lightGreen,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              // color: Colors.yellow,
              width: width * 0.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Text(
                    topic,
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: height * 0.007),
                  const Text(
                    '20 Questions',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 15.0,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  const Text(
                    '0 Points',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: AppColors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 10.0,
                ),
              ),
              onPressed: onPressed,
              child: const Text(
                'Start',
                style: TextStyle(
                  color: AppColors.lightGreen,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
