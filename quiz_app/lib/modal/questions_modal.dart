// To parse this JSON data, do
//
//     final questions = questionsFromJson(jsonString);

// ignore_for_file: constant_identifier_names

import 'dart:convert';

List<Questions> questionsFromJson(String str) =>
    List<Questions>.from(json.decode(str).map((x) => Questions.fromJson(x)));

String questionsToJson(List<Questions> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Questions {
  Questions({
    this.id,
    this.question,
    this.description,
    this.answers,
    this.multipleCorrectAnswers,
    this.correctAnswers,
    this.correctAnswer,
    this.explanation,
    this.tip,
    this.tags,
    this.category,
    this.difficulty,
  });

  final int? id;
  final String? question;
  final dynamic description;
  final Answers? answers;
  final String? multipleCorrectAnswers;
  final CorrectAnswers? correctAnswers;
  final String? correctAnswer;
  final String? explanation;
  final dynamic tip;
  final List<Tag>? tags;
  final String? category;
  final Difficulty? difficulty;

  factory Questions.fromJson(Map<String, dynamic> json) => Questions(
        id: json["id"],
        question: json["question"],
        description: json["description"],
        answers: Answers.fromJson(json["answers"]),
        multipleCorrectAnswers: json["multiple_correct_answers"],
        correctAnswers: CorrectAnswers.fromJson(json["correct_answers"]),
        correctAnswer: json["correct_answer"],
        explanation: json["explanation"],
        tip: json["tip"],
        tags: List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x))),
        category: json["category"],
        difficulty: difficultyValues.map![json["difficulty"]],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "question": question,
        "description": description,
        "answers": answers!.toJson(),
        "multiple_correct_answers": multipleCorrectAnswers,
        "correct_answers": correctAnswers!.toJson(),
        "correct_answer": correctAnswer,
        "explanation": explanation,
        "tip": tip,
        "tags": List<dynamic>.from(
          tags!.map(
            (x) => x.toJson(),
          ),
        ),
        "category": category,
        "difficulty": difficultyValues.reverse[difficulty],
      };
}

class Answers {
  Answers({
    this.answerA,
    this.answerB,
    this.answerC,
    this.answerD,
    this.answerE,
    this.answerF,
  });

  final String? answerA;
  final String? answerB;
  final String? answerC;
  final String? answerD;
  final String? answerE;
  final dynamic answerF;

  factory Answers.fromJson(Map<String, dynamic> json) => Answers(
        answerA: json["answer_a"],
        answerB: json["answer_b"],
        answerC: json["answer_c"],
        answerD: json["answer_d"],
        answerE: json["answer_e"],
        answerF: json["answer_f"],
      );

  Map<String, dynamic> toJson() => {
        "answer_a": answerA,
        "answer_b": answerB,
        "answer_c": answerC,
        "answer_d": answerD,
        "answer_e": answerE,
        "answer_f": answerF,
      };
}

class CorrectAnswers {
  CorrectAnswers({
    this.answerACorrect,
    this.answerBCorrect,
    this.answerCCorrect,
    this.answerDCorrect,
    this.answerECorrect,
    this.answerFCorrect,
  });

  final String? answerACorrect;
  final String? answerBCorrect;
  final String? answerCCorrect;
  final String? answerDCorrect;
  final String? answerECorrect;
  final String? answerFCorrect;

  factory CorrectAnswers.fromJson(Map<String, dynamic> json) => CorrectAnswers(
        answerACorrect: json["answer_a_correct"],
        answerBCorrect: json["answer_b_correct"],
        answerCCorrect: json["answer_c_correct"],
        answerDCorrect: json["answer_d_correct"],
        answerECorrect: json["answer_e_correct"],
        answerFCorrect: json["answer_f_correct"],
      );

  Map<String, dynamic> toJson() => {
        "answer_a_correct": answerACorrect,
        "answer_b_correct": answerBCorrect,
        "answer_c_correct": answerCCorrect,
        "answer_d_correct": answerDCorrect,
        "answer_e_correct": answerECorrect,
        "answer_f_correct": answerFCorrect,
      };
}

enum Difficulty { MEDIUM, EASY }

final difficultyValues =
    EnumValues({"Easy": Difficulty.EASY, "Medium": Difficulty.MEDIUM});

class Tag {
  Tag({
    this.name,
  });

  final String? name;

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map!.map((k, v) => MapEntry(v, k));
    return reverseMap!;
  }
}
