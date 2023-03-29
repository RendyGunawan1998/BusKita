// To parse this JSON data, do
//
//     final emergencyModel = emergencyModelFromJson(jsonString);

import 'dart:convert';

List<EmergencyModel> emergencyModelFromJson(String str) =>
    List<EmergencyModel>.from(
        json.decode(str).map((x) => EmergencyModel.fromJson(x)));

String emergencyModelToJson(List<EmergencyModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EmergencyModel {
  EmergencyModel({
    this.id,
    this.nama,
    this.nomor,
  });

  int id;
  String nama;
  String nomor;

  factory EmergencyModel.fromJson(Map<String, dynamic> json) => EmergencyModel(
        id: json["id"],
        nama: json["nama"],
        nomor: json["nomor"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "nomor": nomor,
      };
}
