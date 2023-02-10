import 'dart:convert';
// import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:quiz_app/modal/questions_modal.dart';

class ApiService {
  List<Questions> questions = [];

  Future<List<Questions>> getQuestions() async {
    // log('Start');
    const String baseUrl = 'https://opentdb.com/api.php?amount=15&category=18';

    final response = await http.get(
      Uri.parse(baseUrl),
    );
    // log(response.statusCode.toString());

    if (response.statusCode == 200) {
      final temp = jsonDecode(response.body);
      questions.add(Questions.fromJson(temp));

      // log(questions.toString());
      return questions;
    } else {
      throw Exception('Questions not found. from api service.');
    }
  }
}
