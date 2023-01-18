import 'dart:convert';
import 'package:http/http.dart' as http;

import '../modals/ads_modal.dart';

class ApiService {
  final String endPointUrl = 'https://bachaopakistan.com/demo/public/api/ads';

  Future<List<Datum>> getAds() async {
    http.Response response = await http.get(Uri.parse(endPointUrl));
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      List<dynamic> body = json['data'];
      List<Datum> ads =
          body.map((dynamic item) => Datum.fromJson(item)).toList();
      // ads.shuffle();
      return ads;
    } else {
      throw ("Can't get ads.");
    }
  }
}
