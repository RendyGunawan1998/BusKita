// To parse this JSON data, do
//
//     final kendaraanModel = kendaraanModelFromJson(jsonString);

import 'dart:convert';

List<KendaraanModel> kendaraanModelFromJson(String str) =>
    List<KendaraanModel>.from(
        json.decode(str).map((x) => KendaraanModel.fromJson(x)));

String kendaraanModelToJson(List<KendaraanModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class KendaraanModel {
  KendaraanModel({
    this.id,
    this.nama,
    this.jenisKendaraan,
    this.noPolisi,
    this.kodeKendaraan,
    this.jumlahKursi,
    this.qrCode,
    this.created,
    this.updated,
  });

  int id;
  String nama;
  int jenisKendaraan;
  String noPolisi;
  String kodeKendaraan;
  int jumlahKursi;
  String qrCode;
  DateTime created;
  DateTime updated;

  KendaraanModel copyWith({
    int id,
    String nama,
    int jenisKendaraan,
    String noPolisi,
    String kodeKendaraan,
    int jumlahKursi,
    String qrCode,
    DateTime created,
    DateTime updated,
  }) =>
      KendaraanModel(
        id: id ?? this.id,
        nama: nama ?? this.nama,
        jenisKendaraan: jenisKendaraan ?? this.jenisKendaraan,
        noPolisi: noPolisi ?? this.noPolisi,
        kodeKendaraan: kodeKendaraan ?? this.kodeKendaraan,
        jumlahKursi: jumlahKursi ?? this.jumlahKursi,
        qrCode: qrCode ?? this.qrCode,
        created: created ?? this.created,
        updated: updated ?? this.updated,
      );

  factory KendaraanModel.fromJson(Map<String, dynamic> json) => KendaraanModel(
        id: json["id"] == null ? null : json["id"],
        nama: json["nama"] == null ? null : json["nama"],
        jenisKendaraan:
            json["jenis_kendaraan"] == null ? null : json["jenis_kendaraan"],
        noPolisi: json["no_polisi"] == null ? null : json["no_polisi"],
        kodeKendaraan:
            json["kode_kendaraan"] == null ? null : json["kode_kendaraan"],
        jumlahKursi: json["jumlah_kursi"] == null ? null : json["jumlah_kursi"],
        qrCode: json["qr_code"] == null ? null : json["qr_code"],
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
        "qr_code": qrCode == null ? null : qrCode,
        "created": created == null ? null : created.toIso8601String(),
        "updated": updated == null ? null : updated.toIso8601String(),
      };
}
