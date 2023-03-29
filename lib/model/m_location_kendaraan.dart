// To parse this JSON data, do
//
//     final locationKendaraanModel = locationKendaraanModelFromJson(jsonString);

import 'dart:convert';

LocationKendaraanModel locationKendaraanModelFromJson(String str) =>
    LocationKendaraanModel.fromJson(json.decode(str));

String locationKendaraanModelToJson(LocationKendaraanModel data) =>
    json.encode(data.toJson());

class LocationKendaraanModel {
  LocationKendaraanModel({
    this.id,
    this.nama,
    this.jenisKendaraan,
    this.noPolisi,
    this.kodeKendaraan,
    this.jumlahKursi,
    this.qrCode,
    this.latitude,
    this.longitude,
    this.created,
    this.updated,
  });

  int id;
  String nama;
  int jenisKendaraan;
  String noPolisi;
  String kodeKendaraan;
  int jumlahKursi;
  dynamic qrCode;
  String latitude;
  String longitude;
  DateTime created;
  DateTime updated;

  LocationKendaraanModel copyWith({
    int id,
    String nama,
    int jenisKendaraan,
    String noPolisi,
    String kodeKendaraan,
    int jumlahKursi,
    dynamic qrCode,
    String latitude,
    String longitude,
    DateTime created,
    DateTime updated,
  }) =>
      LocationKendaraanModel(
        id: id ?? this.id,
        nama: nama ?? this.nama,
        jenisKendaraan: jenisKendaraan ?? this.jenisKendaraan,
        noPolisi: noPolisi ?? this.noPolisi,
        kodeKendaraan: kodeKendaraan ?? this.kodeKendaraan,
        jumlahKursi: jumlahKursi ?? this.jumlahKursi,
        qrCode: qrCode ?? this.qrCode,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        created: created ?? this.created,
        updated: updated ?? this.updated,
      );

  factory LocationKendaraanModel.fromJson(Map<String, dynamic> json) =>
      LocationKendaraanModel(
        id: json["id"] == null ? null : json["id"],
        nama: json["nama"] == null ? null : json["nama"],
        jenisKendaraan:
            json["jenis_kendaraan"] == null ? null : json["jenis_kendaraan"],
        noPolisi: json["no_polisi"] == null ? null : json["no_polisi"],
        kodeKendaraan:
            json["kode_kendaraan"] == null ? null : json["kode_kendaraan"],
        jumlahKursi: json["jumlah_kursi"] == null ? null : json["jumlah_kursi"],
        qrCode: json["qr_code"],
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
        "jenis_kendaraan": jenisKendaraan == null ? null : jenisKendaraan,
        "no_polisi": noPolisi == null ? null : noPolisi,
        "kode_kendaraan": kodeKendaraan == null ? null : kodeKendaraan,
        "jumlah_kursi": jumlahKursi == null ? null : jumlahKursi,
        "qr_code": qrCode,
        "latitude": latitude == null ? null : latitude,
        "longitude": longitude == null ? null : longitude,
        "created": created == null ? null : created.toIso8601String(),
        "updated": updated == null ? null : updated.toIso8601String(),
      };
}
