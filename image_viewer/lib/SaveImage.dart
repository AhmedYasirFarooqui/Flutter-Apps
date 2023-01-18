import 'dart:convert';

SaveImage saveImageFromJson(String str) => SaveImage.fromJson(json.decode(str));

String saveImageToJson(SaveImage data) => json.encode(data.toJson());

class SaveImage {
  SaveImage({
    this.filename,
    this.filepath,
  });

  String? filename;
  String? filepath;

  factory SaveImage.fromJson(Map<String, dynamic> json) => SaveImage(
        filename: json["filename"],
        filepath: json["filepath"],
      );

  Map<String, dynamic> toJson() => {
        "filename": filename,
        "filepath": filepath,
      };
}
