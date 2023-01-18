// To parse this JSON data, do
//
//     final ads = adsFromJson(jsonString);

// import 'package:meta/meta.dart';
import 'dart:convert';

Ads adsFromJson(String str) => Ads.fromJson(json.decode(str));

String adsToJson(Ads data) => json.encode(data.toJson());

class Ads {
  Ads({
    required this.data,
  });

  List<Datum> data;

  factory Ads.fromJson(Map<String, dynamic> json) => Ads(
        data: List<Datum>.from(
          json["data"].map(
            (x) => Datum.fromJson(x),
          ),
        ),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(
          data.map(
            (x) => x.toJson(),
          ),
        ),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.url,
    required this.time,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  dynamic url;
  dynamic time;
  String image;
  DateTime createdAt;
  DateTime updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        url: json["url"],
        time: json["time"],
        image: json["image"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "time": time,
        "image": image,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
