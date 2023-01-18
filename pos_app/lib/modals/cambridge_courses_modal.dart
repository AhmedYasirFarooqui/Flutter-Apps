// To parse this JSON data, do
//
//     final cambridgeCourses = cambridgeCoursesFromJson(jsonString);

import 'dart:convert';

CambridgeCourses cambridgeCoursesFromJson(String str) =>
    CambridgeCourses.fromJson(json.decode(str));

String cambridgeCoursesToJson(CambridgeCourses data) =>
    json.encode(data.toJson());

class CambridgeCourses {
  CambridgeCourses({
    this.status,
    this.data,
  });

  String? status;
  List<CambridgeDatum>? data;

  factory CambridgeCourses.fromJson(Map<String, dynamic>? json) =>
      CambridgeCourses(
        status: json!["status"],
        data: List<CambridgeDatum>.from(
            json["data"].map((x) => CambridgeDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class CambridgeDatum {
  CambridgeDatum({
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

  factory CambridgeDatum.fromJson(Map<String, dynamic> json) => CambridgeDatum(
        id: json["id"],
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
