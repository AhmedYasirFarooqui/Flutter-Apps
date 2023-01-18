// ignore_for_file: unused_local_variable, non_constant_identifier_names

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/modals/news_modal.dart';

class ApiService {
  final String baseUrl =
      'https://newsapi.org/v2/top-headlines?country=us&apiKey=30b23ade3238476bb13f506798179bc8';

  Future<List<Article>> GetArticle() async {
    http.Response response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      List<dynamic> body = json['articles'];
      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      throw ("Can't get the Articles");
    }
  }
}
