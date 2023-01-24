import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
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
  int getindex = 0;
  PageController pageViewController = PageController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.lightGreen,
      appBar: AppBar(
        title: const Text(
          '00:00',
          style: TextStyle(
            fontSize: 50.0,
            fontWeight: FontWeight.bold,
            color: AppColors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.lightGreen,
        elevation: 0.0,
        toolbarHeight: height * 0.15,
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      // ),
      body: questions != null && questions!.isNotEmpty
          ? Container(
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                ),
              ),
              height: height * 0.8,
              child: Column(
                children: [
                  Text(
                    '${getindex + 1}/${questions!.length}',
                    style: const TextStyle(
                      color: AppColors.green,
                      fontSize: 18.0,
                    ),
                  ),
                  Expanded(
                    child: PageView.builder(
                      controller: pageViewController,
                      itemCount: questions!.length,
                      allowImplicitScrolling: true,
                      onPageChanged: (index) {
                        setState(() {
                          getindex = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(height: height * 0.01),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Container(
                                width: width,
                                height: height * 0.1,
                                padding: const EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  // border: Border.all(
                                  //   color: AppColors.green,
                                  // ),
                                  borderRadius: BorderRadius.circular(15.0),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: AppColors.green,
                                      blurRadius: 2.5,
                                      spreadRadius: 0.5,
                                      blurStyle: BlurStyle.outer,
                                      offset: Offset(0.0, 0.0),
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Text(
                                    '${questions![index].question}',
                                    textAlign: TextAlign.justify,
                                    style: const TextStyle(
                                      color: AppColors.green,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            questions![index].answers != null
                                ? Container(
                                    width: width,
                                    height: height * 0.54,
                                    //color: Colors.blue,
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
                                                  horizontal: 0.0,
                                                ),
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
                                                  horizontal: 0.0,
                                                ),
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
                                                  horizontal: 0.0,
                                                ),
                                                groupValue: selectedAnswer,
                                                value: questions![index]
                                                    .answers!
                                                    .answerC!,
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
                                        questions![index].answers!.answerD !=
                                                null
                                            ? LabeledRadio(
                                                label: questions![index]
                                                    .answers!
                                                    .answerD!,
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 0.0,
                                                ),
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
                                                  horizontal: 0.0,
                                                ),
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
                                                  horizontal: 0.0,
                                                ),
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
                        );
                      },
                    ),
                  ),
                ],
              ),
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
              activeColor: AppColors.lightGreen,
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
      color: AppColors.transparent,
      alignment: Alignment.centerLeft,
      height: height * 0.08,
      width: width * 0.8,
      child: Text(
        answers!,
        softWrap: true,
        //textDirection: TextDirection.ltr,
        textAlign: TextAlign.justify,
        style: const TextStyle(
          fontSize: 16.0,
          color: AppColors.green,
        ),
      ),
    );
  }
}
