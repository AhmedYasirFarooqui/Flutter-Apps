import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quiz_app/modal/questions_modal.dart';

class ApiService {
  Future<List<Questions>> getQuestions() async {
    const String baseUrl = 'https://quizapi.io';
    const String endPoint = 'api/v1/questions';
    const String apiKey = 'xS7ALZlrJlBMcTA8H2n4seaz4ktohxn2aIUFCCi1';
    const String limit = '10';
    final response = await http
        .get(Uri.parse('$baseUrl/$endPoint?apiKey=$apiKey&limit=$limit'));

    if (response.statusCode == 200) {
      List<Questions> questions = [];
      final temp = jsonDecode(response.body);
      for (final question in temp) {
        questions.add(Questions.fromJson(question));
      }
      return questions;
    } else {
      throw Exception('Questions not found. from api service.');
    }
  }
}
