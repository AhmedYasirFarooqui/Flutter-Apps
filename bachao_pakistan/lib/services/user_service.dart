import 'dart:convert';
import 'package:http/http.dart' as http;

import '../modals/users_modal.dart';

class UserService {
  final String endPointUrl = 'https://bachaopakistan.com/demo/public/api/users';
  Future<List<Datum>> getUsers() async {
    http.Response response = await http.get(Uri.parse(endPointUrl));
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      List<dynamic> body = json['data'];
      List<Datum> users =
          body.map((dynamic item) => Datum.fromJson(item)).toList();

      return users;
    } else {
      throw ("Can't get users.");
    }
  }
}
