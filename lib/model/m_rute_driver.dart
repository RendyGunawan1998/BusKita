// To parse this JSON data, do
//
//     final ruteDriverModel = ruteDriverModelFromJson(jsonString);

import 'dart:convert';

List<RuteDriverModel> ruteDriverModelFromJson(String str) =>
    List<RuteDriverModel>.from(
        json.decode(str).map((x) => RuteDriverModel.fromJson(x)));

String ruteDriverModelToJson(List<RuteDriverModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RuteDriverModel {
  RuteDriverModel({
    this.id,
    this.rute,
    this.lat1,
    this.lon1,
    this.lat2,
    this.lon2,
    this.created,
    this.updated,
  });

  int id;
  String rute;
  String lat1;
  String lon1;
  String lat2;
  String lon2;
  DateTime created;
  DateTime updated;

  RuteDriverModel copyWith({
    int id,
    String rute,
    String lat1,
    String lon1,
    String lat2,
    String lon2,
    DateTime created,
    DateTime updated,
  }) =>
      RuteDriverModel(
        id: id ?? this.id,
        rute: rute ?? this.rute,
        lat1: lat1 ?? this.lat1,
        lon1: lon1 ?? this.lon1,
        lat2: lat2 ?? this.lat2,
        lon2: lon2 ?? this.lon2,
        created: created ?? this.created,
        updated: updated ?? this.updated,
      );

  factory RuteDriverModel.fromJson(Map<String, dynamic> json) =>
      RuteDriverModel(
        id: json["id"] == null ? null : json["id"],
        rute: json["rute"] == null ? null : json["rute"],
        lat1: json["lat1"] == null ? null : json["lat1"],
        lon1: json["lon1"] == null ? null : json["lon1"],
        lat2: json["lat2"] == null ? null : json["lat2"],
        lon2: json["lon2"] == null ? null : json["lon2"],
        created:
            json["created"] == null ? null : DateTime.parse(json["created"]),
        updated:
            json["updated"] == null ? null : DateTime.parse(json["updated"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "rute": rute == null ? null : rute,
        "lat1": lat1 == null ? null : lat1,
        "lon1": lon1 == null ? null : lon1,
        "lat2": lat2 == null ? null : lat2,
        "lon2": lon2 == null ? null : lon2,
        "created": created == null ? null : created.toIso8601String(),
        "updated": updated == null ? null : updated.toIso8601String(),
      };
}
