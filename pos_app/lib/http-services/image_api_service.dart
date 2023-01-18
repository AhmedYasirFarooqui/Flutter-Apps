import 'dart:convert';

import 'package:http/http.dart' as http;

import '../modals/images_modal.dart';

class ImageApiService {
  Future<List<Datum>> getImages() async {
    http.Response response = await http.get(
      Uri.parse('https://tutota.pk/demo/public/api/sliders'),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic>? json = jsonDecode(response.body);
      List<dynamic>? body = json!['data'];
      List<Datum>? images =
          body!.map((dynamic image) => Datum.fromJson(image)).toList();
      return images;
    } else {
      throw ("Images don't exist");
    }
  }
}
