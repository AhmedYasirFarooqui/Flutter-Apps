// ignore_for_file: unnecessary_null_comparison

import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:quiz_app/utils/assets.dart';
import 'package:quiz_app/utils/colors.dart';
import 'package:quiz_app/utils/services/api_service.dart';
import 'package:quiz_app/utils/widgets/buttons.dart';

import 'modal/questions_modal.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  ApiService apiService = ApiService();
  Future<List<Questions>>? questions;
  var currentQuestionIndex = 0;
  bool isLoaded = false;
  bool? isRadioSelected = true;
  List<String>? options = [];
  List<String>? answers = [];
  String selectedAnswer = '';
  int getindex = 0;
  int currentIndex = 0;
  int seconds = 60;
  Timer? timer;
  Color boxColor = AppColors.white;
  Color textColor = AppColors.green;
  Color radioColor = AppColors.lightGreen;
  Color borderColor = AppColors.lightGreen;
  startTimer() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (mounted) {
          setState(
            () {
              if (seconds > 0) {
                seconds--;
                log('$seconds');
              } else {
                gotoNextQuestion();
                log('time out');
              }
            },
          );
        }
      },
    );
  }

  gotoNextQuestion() {
    isLoaded = false;
    currentQuestionIndex++;
    // resetColors();
    // timer!.cancel();
    seconds = 60;
    // startTimer();
  }

  @override
  void initState() {
    //startTimer();
    getQuestions();
    super.initState();
  }

  Future<void> getQuestions() async {
    questions = apiService.getQuestions();
    setState(() {});
  }

  convertToString(String string) {
    var unescape = HtmlUnescape();
    var text = unescape.convert(string);
    return text;
  }

  @override
  void dispose() {
    // timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.lightGreen,
      appBar: AppBar(
        title: Text(
          '$seconds',
          style: TextStyle(
            fontSize: 50.0,
            fontWeight: FontWeight.bold,
            color: seconds <= 10 ? AppColors.red : AppColors.white,
          ),
        ),
        actions: [
          SizedBox(
            width: width * 0.2,
            child: Center(
              child: Text(
                '${currentQuestionIndex + 1} / $currentIndex',
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
        centerTitle: true,
        backgroundColor: AppColors.lightGreen,
        elevation: 0.0,
        toolbarHeight: height * 0.1,
      ),
      body: FutureBuilder(
        future: questions,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data!.last.results;
            if (isLoaded == false) {
              options = data![currentQuestionIndex].incorrectAnswers;
              options!.add(data[currentQuestionIndex].correctAnswer!);
              options!.shuffle();
              isLoaded = true;
            }

            return data != null && data.isNotEmpty
                ? Container(
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0),
                      ),
                      image: DecorationImage(
                        image: AssetImage(Assets.booksWallpaper),
                        opacity: 0.5,
                        fit: BoxFit.cover,
                      ),
                    ),
                    height: height * 0.9,
                    child: Column(
                      children: [
                        SizedBox(height: height * 0.03),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Container(
                            width: width,
                            height: height * 0.2,
                            padding: const EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: AppColors.lightGreen,
                            ),
                            child: Center(
                              child: Text(
                                convertToString(
                                    '${snapshot.data!.last.results![currentQuestionIndex].question}'),
                                textAlign: TextAlign.justify,
                                style: const TextStyle(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: height * 0.015),
                        options != null && options!.isNotEmpty
                            ? Expanded(
                                child: ListView.builder(
                                  itemCount: options!.length,
                                  itemBuilder: (context, index) {
                                    currentIndex = data.length;
                                    return Container(
                                      width: width * 0.95,
                                      height: height * 0.08,
                                      padding: const EdgeInsets.all(5.0),
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 12.0,
                                        vertical: 10.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: boxColor,
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        border: Border.all(
                                          color: borderColor,
                                          width: 2.0,
                                        ),
                                      ),
                                      child: LabeledRadio(
                                        radioColor: radioColor,
                                        textColor: textColor,
                                        label: convertToString(options![index]),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 2.0,
                                        ),
                                        groupValue: selectedAnswer,
                                        value: convertToString(options![index]),
                                        onChanged: (String newValue) {
                                          // log(data[index]
                                          //     .correctAnswer
                                          //     .toString());
                                          setState(
                                            () {
                                              selectedAnswer = newValue;
                                              if (currentQuestionIndex <
                                                  data.length - 1) {
                                                if (selectedAnswer ==
                                                    data[index].correctAnswer) {
                                                  answers!.add(selectedAnswer);
                                                } else {
                                                  answers!.add(selectedAnswer);
                                                }
                                              } else {
                                                // timer!.cancel();
                                              }
                                            },
                                          );
                                        },
                                      ),
                                    );
                                  },
                                ),
                              )
                            : const CircularProgressIndicator(
                                color: AppColors.lightGreen,
                              ),
                        CustomButtons(
                          buttonColor: AppColors.lightGreen,
                          text: currentQuestionIndex < data.length - 1
                              ? 'Next'
                              : 'Finish',
                          textColor: AppColors.white,
                          onTap: () {
                            currentQuestionIndex < data.length - 1
                                ? gotoNextQuestion()
                                : log('the end.');
                            setState(() {});
                          },
                        ),
                        const SizedBox(height: 10.0),
                      ],
                    ),
                  )
                : const CircularProgressIndicator(
                    color: AppColors.lightGreen,
                  );
          } else {
            return Center(
              child: SizedBox(
                width: width * 0.6,
                height: height * 0.3,
                child: const CircularProgressIndicator(
                  color: AppColors.white,
                  strokeWidth: 7.0,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

class LabeledRadio extends StatelessWidget {
  const LabeledRadio({
    super.key,
    required this.label,
    required this.padding,
    required this.groupValue,
    required this.value,
    required this.radioColor,
    required this.textColor,
    required this.onChanged,
  });

  final String label;
  final EdgeInsets padding;
  final String groupValue;
  final String value;
  final Color radioColor;
  final Color textColor;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        log('onTap()');
        // if (value != groupValue) {
        onChanged(value);
        // }
      },
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            Radio<String>(
              activeColor: radioColor,
              groupValue: groupValue,
              value: value,
              onChanged: (String? newValue) {
                onChanged(newValue!);
              },
            ),
            Options(
              answers: label,
              textColor: textColor,
            ),
          ],
        ),
      ),
    );
  }
}

class Options extends StatelessWidget {
  const Options({
    Key? key,
    required this.answers,
    required this.textColor,
  }) : super(key: key);

  final String? answers;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      answers!,
      softWrap: true,
      //textDirection: TextDirection.ltr,
      textAlign: TextAlign.justify,
      style: TextStyle(
        fontSize: 15.0,
        color: textColor,
      ),
    );
  }
}
