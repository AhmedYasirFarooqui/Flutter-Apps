// ignore_for_file: unused_import, non_constant_identifier_names

import 'dart:io';

import 'package:image_picker/image_picker.dart';

class Photo {
  dynamic id;
  String? photo_name;

  Photo(this.id, this.photo_name);

  Map<String, dynamic> toMap() {
    var map = {
      'id': id,
      'photo_name': photo_name,
    };
    return map;
  }

  Photo.fromMap(Map map) {
    id = map['id'];
    photo_name = map['photo_name'];
  }
}
