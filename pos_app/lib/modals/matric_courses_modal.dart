// To parse this JSON data, do
//
//     final matricCourses = matricCoursesFromJson(jsonString);

import 'dart:convert';

MatricCourses matricCoursesFromJson(String str) =>
    MatricCourses.fromJson(json.decode(str));

String matricCoursesToJson(MatricCourses data) => json.encode(data.toJson());

class MatricCourses {
  MatricCourses({
    this.status,
    this.data,
  });

  String? status;
  List<MatricDatum>? data;

  factory MatricCourses.fromJson(Map<String, dynamic>? json) => MatricCourses(
        status: json!["status"],
        data: List<MatricDatum>.from(
            json["data"].map((x) => MatricDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class MatricDatum {
  MatricDatum({
    this.id,
    this.name,
    this.image,
    this.type,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  String? image;
  String? type;
  DateTime? createdAt;
  dynamic updatedAt;

  factory MatricDatum.fromJson(Map<String, dynamic>? json) => MatricDatum(
        id: json!["id"],
        name: json["name"],
        image: json["image"],
        type: json["type"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "type": type,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt,
      };
}
