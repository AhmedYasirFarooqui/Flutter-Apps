import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quiz_app/utils/colors.dart';
import 'package:quiz_app/utils/services/api_service.dart';

import 'modal/questions_modal.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  ApiService apiService = ApiService();
  List<Questions>? questions = [];
  bool? isRadioSelected = true;

  var currentIndex = 0;
  int seconds = 30;
  Timer? timer;

  startTimer() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        setState(
          () {
            if (seconds > 0) {
              seconds--;
              log('$seconds');
            } else {
              timer.cancel();
            }
          },
        );
      },
    );
  }

  @override
  void initState() {
    //startTimer();
    getQuestions();
    super.initState();
  }

  Future<void> getQuestions() async {
    questions!.addAll(await apiService.getQuestions());
    setState(() {});
  }

  @override
  void dispose() {
    //timer!.cancel();
    super.dispose();
  }

  String selectedAnswer = '';
  int increment = 0;
  PageController pageViewController = PageController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.green,
      body: questions != null && questions!.isNotEmpty
          ? Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: pageViewController,
                    itemCount: questions!.length,
                    itemBuilder: (context, index) {
                      return Container(
                        color: AppColors.green,
                        width: width,
                        height: height,
                        child: Column(
                          children: [
                            SizedBox(height: height / 3),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              child: SizedBox(
                                width: width,
                                height: height / 10,
                                child: Text(
                                  'Q ${index + 1}: ${questions![index].question}',
                                  textAlign: TextAlign.justify,
                                  style: const TextStyle(
                                    color: AppColors.white,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                            ),
                            //const SizedBox(height: 20.0),
                            questions![index].answers != null
                                ? Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 1.0),
                                    width: width,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        questions![index].answers!.answerA !=
                                                null
                                            ? LabeledRadio(
                                                label: questions![index]
                                                    .answers!
                                                    .answerA!,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 0.0),
                                                groupValue: selectedAnswer,
                                                value: questions![index]
                                                    .answers!
                                                    .answerA!,
                                                onChanged: (String newValue) {
                                                  setState(
                                                    () {
                                                      selectedAnswer = newValue;
                                                    },
                                                  );
                                                },
                                              )
                                            : const SizedBox(),
                                        questions![index].answers!.answerB !=
                                                null
                                            ? LabeledRadio(
                                                label: questions![index]
                                                    .answers!
                                                    .answerB!,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 0.0),
                                                groupValue: selectedAnswer,
                                                value: questions![index]
                                                    .answers!
                                                    .answerB!,
                                                onChanged: (String newValue) {
                                                  setState(
                                                    () {
                                                      selectedAnswer = newValue;
                                                    },
                                                  );
                                                },
                                              )
                                            : const SizedBox(),
                                        questions![index].answers!.answerC !=
                                                null
                                            ? LabeledRadio(
                                                label: questions![index]
                                                    .answers!
                                                    .answerC!,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 0.0),
                                                groupValue: selectedAnswer,
                                                value: questions![index]
                                                    .answers!
                                                    .answerC!,
                                                onChanged: (String newValue) {
                                                  log("$newValue");
                                                  setState(
                                                    () {
                                                      selectedAnswer = newValue;
                                                    },
                                                  );
                                                },
                                              )
                                            : const SizedBox(),
                                        questions![index].answers!.answerD !=
                                                null
                                            ? LabeledRadio(
                                                label: questions![index]
                                                    .answers!
                                                    .answerD!,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 0.0),
                                                groupValue: selectedAnswer,
                                                value: questions![index]
                                                    .answers!
                                                    .answerD!,
                                                onChanged: (String newValue) {
                                                  setState(
                                                    () {
                                                      selectedAnswer = newValue;
                                                    },
                                                  );
                                                },
                                              )
                                            : const SizedBox(),
                                        questions![index].answers!.answerE !=
                                                null
                                            ? LabeledRadio(
                                                label: questions![index]
                                                    .answers!
                                                    .answerE!,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 0.0),
                                                groupValue: selectedAnswer,
                                                value: questions![index]
                                                    .answers!
                                                    .answerE!,
                                                onChanged: (String newValue) {
                                                  setState(
                                                    () {
                                                      selectedAnswer = newValue;
                                                    },
                                                  );
                                                },
                                              )
                                            : const SizedBox(),
                                        questions![index].answers!.answerF !=
                                                null
                                            ? LabeledRadio(
                                                label: questions![index]
                                                    .answers!
                                                    .answerF!,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 0.0),
                                                groupValue: selectedAnswer,
                                                value: questions![index]
                                                    .answers!
                                                    .answerF!,
                                                onChanged: (String newValue) {
                                                  log(newValue);
                                                  setState(
                                                    () {
                                                      selectedAnswer = newValue;
                                                    },
                                                  );
                                                },
                                              )
                                            : const SizedBox(),
                                      ],
                                    ),
                                  )
                                : const SizedBox(),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: height / 10),
                GestureDetector(
                  onTap: () {
                    pageViewController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn,
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    height: height / 15,
                    child: const Center(
                      child: Text(
                        'Next',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColors.green,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
              ],
            )
          : const Center(
              child: SizedBox(
                width: 100.0,
                height: 100.0,
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
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
    required this.onChanged,
  });

  final String label;
  final EdgeInsets padding;
  final String groupValue;
  final String value;
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
              activeColor: Colors.white,
              groupValue: groupValue,
              value: value,
              onChanged: (String? newValue) {
                onChanged(newValue!);
              },
            ),
            Options(answers: label),
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
  }) : super(key: key);

  final String? answers;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      alignment: Alignment.centerLeft,
      height: height / 20,
      width: width / 1.2,
      child: Text(
        answers!,
        softWrap: true,
        maxLines: 3,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.start,
        style: const TextStyle(
          fontSize: 16.0,
          color: Colors.white,
        ),
      ),
    );
  }
}
