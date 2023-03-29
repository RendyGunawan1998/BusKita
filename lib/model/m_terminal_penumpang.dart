// To parse this JSON data, do
//
//     final terminalModel = terminalModelFromJson(jsonString);

import 'dart:convert';

List<TerminalModel> terminalModelFromJson(String str) =>
    List<TerminalModel>.from(
        json.decode(str).map((x) => TerminalModel.fromJson(x)));

String terminalModelToJson(List<TerminalModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TerminalModel {
  TerminalModel({
    this.id,
    this.nama,
    this.kodeTerminal,
    this.alamat,
    this.latitude,
    this.longitude,
    this.created,
    this.updated,
  });

  int id;
  String nama;
  String kodeTerminal;
  String alamat;
  String latitude;
  String longitude;
  DateTime created;
  DateTime updated;

  TerminalModel copyWith({
    int id,
    String nama,
    String kodeTerminal,
    String alamat,
    String latitude,
    String longitude,
    DateTime created,
    DateTime updated,
  }) =>
      TerminalModel(
        id: id ?? this.id,
        nama: nama ?? this.nama,
        kodeTerminal: kodeTerminal ?? this.kodeTerminal,
        alamat: alamat ?? this.alamat,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        created: created ?? this.created,
        updated: updated ?? this.updated,
      );

  factory TerminalModel.fromJson(Map<String, dynamic> json) => TerminalModel(
        id: json["id"] == null ? null : json["id"],
        nama: json["nama"] == null ? null : json["nama"],
        kodeTerminal:
            json["kode_terminal"] == null ? null : json["kode_terminal"],
        alamat: json["alamat"] == null ? null : json["alamat"],
        latitude: json["latitude"] == null ? null : json["latitude"],
        longitude: json["longitude"] == null ? null : json["longitude"],
        created:
            json["created"] == null ? null : DateTime.parse(json["created"]),
        updated:
            json["updated"] == null ? null : DateTime.parse(json["updated"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "nama": nama == null ? null : nama,
        "kode_terminal": kodeTerminal == null ? null : kodeTerminal,
        "alamat": alamat == null ? null : alamat,
        "latitude": latitude == null ? null : latitude,
        "longitude": longitude == null ? null : longitude,
        "created": created == null ? null : created.toIso8601String(),
        "updated": updated == null ? null : updated.toIso8601String(),
      };
}
