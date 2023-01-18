import 'dart:convert';

import 'package:http/http.dart' as http;
import '../modals/cambridge_courses_modal.dart';

class CambridgeApiService {
  Future<List<CambridgeDatum>> getCambridgeCourses() async {
    http.Response response = await http.get(
      Uri.parse('https://tutota.pk/demo/public/api/classes/Cambridge'),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic>? json = jsonDecode(response.body);
      List<dynamic>? body = json!['data'];
      List<CambridgeDatum>? cambridgeCourses = body!
          .map((dynamic course) => CambridgeDatum.fromJson(course))
          .toList();
      return cambridgeCourses;
    } else {
      throw ("courses don't exist");
    }
  }
}
