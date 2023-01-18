import 'dart:convert';

Slm slmFromJson(String str) => Slm.fromJson(json.decode(str));

String slmToJson(Slm data) => json.encode(data.toJson());

class Slm {
  Slm({
    required this.heartRate,
    required this.temperature,
    required this.roomTemperature,
    required this.sp02,
  });

  int heartRate;
  int temperature;
  int roomTemperature;
  int sp02;

  factory Slm.fromJson(Map<String, dynamic> json) => Slm(
        heartRate: json["HeartRate"],
        temperature: json["Temperature"],
        roomTemperature: json["RoomTemperature"],
        sp02: json["Sp02"],
      );

  Map<String, dynamic> toJson() => {
        "HeartRate": heartRate,
        "Temperature": temperature,
        "RoomTemperature": roomTemperature,
        "Sp02": sp02,
      };
}
