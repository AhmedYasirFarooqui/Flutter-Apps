import 'dart:convert';

Images imagesFromJson(String str) => Images.fromJson(json.decode(str));

String imagesToJson(Images data) => json.encode(data.toJson());

class Images {
  Images({
    this.status,
    this.data,
  });

  String? status;
  List<Datum>? data;

  factory Images.fromJson(Map<String, dynamic>? json) => Images(
        status: json!["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.sliderId,
    this.img,
    this.link,
    this.updatedAt,
    this.createdAt,
  });

  int? id;
  dynamic sliderId;
  String? img;
  String? link;
  DateTime? updatedAt;
  DateTime? createdAt;

  factory Datum.fromJson(Map<String, dynamic>? json) => Datum(
        id: json!["id"],
        sliderId: json["slider_id"],
        img: json["img"],
        link: json["link"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slider_id": sliderId,
        "img": img,
        "link": link,
        "updated_at": updatedAt!.toIso8601String(),
        "created_at": createdAt!.toIso8601String(),
      };
}
