import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:quiz_app/quiz_screen.dart';
import 'package:quiz_app/utils/assets.dart';
import 'package:quiz_app/utils/colors.dart';
import 'package:quiz_app/utils/widgets/quiz_topic.dart';

class TopicWiseQuizScreen extends StatefulWidget {
  const TopicWiseQuizScreen({super.key});

  @override
  State<TopicWiseQuizScreen> createState() => _TopicWiseQuizScreenState();
}

class _TopicWiseQuizScreenState extends State<TopicWiseQuizScreen> {
  List<String>? topics = [
    "Computer Science",
    "Maths",
    "History",
    "Geography",
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.lightGreen,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAnimatedDialog(
            context: context,
            barrierDismissible: true,
            animationType: DialogTransitionType.slideFromTop,
            builder: (BuildContext context) {
              return ClassicGeneralDialogWidget(
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'Got It',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: AppColors.green,
                        ),
                      ),
                    ),
                  ),
                ],
                titleText: 'Rules',
                contentText:
                    "Every topic includes 10 to 20 questions which need to be answered within a time limit of about 10-15 minutes.Once the time is up, all options will be disabled and your total points will be displayed on the home screen. You can also check which of your options are correct. Once you leave the quiz, the previous questions will be removed and new questions will appear, so be mindful of that. Good Luck!",
              );
            },
          );
        },
        backgroundColor: AppColors.green,
        elevation: 0.0,
        child: const Icon(
          Icons.question_mark_rounded,
          color: Colors.white,
          size: 30.0,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(height: height * 0.07),
          SizedBox(
            width: width * 0.9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Welcome, \nGuest!',
                  //textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: const Icon(
                    Icons.settings,
                    color: AppColors.white,
                    size: 25.0,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: height * 0.02),
          Expanded(
            child: Container(
              width: width,
              height: height * 0.9,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                ),
                color: AppColors.white,
                image: DecorationImage(
                  image: AssetImage(Assets.booksWallpaper),
                  fit: BoxFit.cover,
                  opacity: 0.5,
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(10.0),
                      itemCount: topics!.length,
                      itemExtent: 115,
                      itemBuilder: (context, index) {
                        return QuizTopicContainer(
                          topic: topics![index],
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => const QuizScreen(),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
