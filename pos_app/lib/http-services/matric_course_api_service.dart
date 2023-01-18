import 'dart:convert';

import 'package:http/http.dart' as http;
import '../modals/matric_courses_modal.dart';

class MatricApiService {
  Future<List<MatricDatum>> getMatricCourses() async {
    http.Response response = await http.get(
      Uri.parse('https://tutota.pk/demo/public/api/classes/Matric'),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic>? json = jsonDecode(response.body);
      List<dynamic>? body = json!['data'];
      List<MatricDatum>? matricCourses =
          body!.map((dynamic course) => MatricDatum.fromJson(course)).toList();
      return matricCourses;
    } else {
      throw ("courses don't exist");
    }
  }
}
