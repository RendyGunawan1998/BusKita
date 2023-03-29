// To parse this JSON data, do
//
//     final perjalananAktifModel = perjalananAktifModelFromJson(jsonString);

import 'dart:convert';

List<PerjalananAktifModel> perjalananAktifModelFromJson(String str) =>
    List<PerjalananAktifModel>.from(
        json.decode(str).map((x) => PerjalananAktifModel.fromJson(x)));

String perjalananAktifModelToJson(List<PerjalananAktifModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PerjalananAktifModel {
  PerjalananAktifModel({
    this.id,
    this.kendaraan,
    this.rute,
    this.hargaTiket,
    this.user,
    this.sisaKursi,
    this.waktuKeberangkatan,
    this.perkiraanWaktuTiba,
    this.selesai,
    this.waktuTiba,
    this.kodePerjalanan,
    this.created,
    this.updated,
  });

  int id;
  Kendaraan kendaraan;
  Rute rute;
  String hargaTiket;
  int user;
  int sisaKursi;
  DateTime waktuKeberangkatan;
  DateTime perkiraanWaktuTiba;
  bool selesai;
  dynamic waktuTiba;
  String kodePerjalanan;
  DateTime created;
  DateTime updated;

  PerjalananAktifModel copyWith({
    int id,
    Kendaraan kendaraan,
    Rute rute,
    String hargaTiket,
    int user,
    int sisaKursi,
    DateTime waktuKeberangkatan,
    DateTime perkiraanWaktuTiba,
    bool selesai,
    dynamic waktuTiba,
    String kodePerjalanan,
    DateTime created,
    DateTime updated,
  }) =>
      PerjalananAktifModel(
        id: id ?? this.id,
        kendaraan: kendaraan ?? this.kendaraan,
        rute: rute ?? this.rute,
        hargaTiket: hargaTiket ?? this.hargaTiket,
        user: user ?? this.user,
        sisaKursi: sisaKursi ?? this.sisaKursi,
        waktuKeberangkatan: waktuKeberangkatan ?? this.waktuKeberangkatan,
        perkiraanWaktuTiba: perkiraanWaktuTiba ?? this.perkiraanWaktuTiba,
        selesai: selesai ?? this.selesai,
        waktuTiba: waktuTiba ?? this.waktuTiba,
        kodePerjalanan: kodePerjalanan ?? this.kodePerjalanan,
        created: created ?? this.created,
        updated: updated ?? this.updated,
      );

  factory PerjalananAktifModel.fromJson(Map<String, dynamic> json) =>
      PerjalananAktifModel(
        id: json["id"] == null ? null : json["id"],
        kendaraan: json["kendaraan"] == null
            ? null
            : Kendaraan.fromJson(json["kendaraan"]),
        rute: json["rute"] == null ? null : Rute.fromJson(json["rute"]),
        hargaTiket: json["harga_tiket"] == null ? null : json["harga_tiket"],
        user: json["user"] == null ? null : json["user"],
        sisaKursi: json["sisa_kursi"] == null ? null : json["sisa_kursi"],
        waktuKeberangkatan: json["waktu_keberangkatan"] == null
            ? null
            : DateTime.parse(json["waktu_keberangkatan"]),
        perkiraanWaktuTiba: json["perkiraan_waktu_tiba"] == null
            ? null
            : DateTime.parse(json["perkiraan_waktu_tiba"]),
        selesai: json["selesai"] == null ? null : json["selesai"],
        waktuTiba: json["waktu_tiba"],
        kodePerjalanan:
            json["kode_perjalanan"] == null ? null : json["kode_perjalanan"],
        created:
            json["created"] == null ? null : DateTime.parse(json["created"]),
        updated:
            json["updated"] == null ? null : DateTime.parse(json["updated"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "kendaraan": kendaraan == null ? null : kendaraan.toJson(),
        "rute": rute == null ? null : rute.toJson(),
        "harga_tiket": hargaTiket == null ? null : hargaTiket,
        "user": user == null ? null : user,
        "sisa_kursi": sisaKursi == null ? null : sisaKursi,
        "waktu_keberangkatan": waktuKeberangkatan == null
            ? null
            : waktuKeberangkatan.toIso8601String(),
        "perkiraan_waktu_tiba": perkiraanWaktuTiba == null
            ? null
            : perkiraanWaktuTiba.toIso8601String(),
        "selesai": selesai == null ? null : selesai,
        "waktu_tiba": waktuTiba,
        "kode_perjalanan": kodePerjalanan == null ? null : kodePerjalanan,
        "created": created == null ? null : created.toIso8601String(),
        "updated": updated == null ? null : updated.toIso8601String(),
      };
}

class Kendaraan {
  Kendaraan({
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
  String qrCode;
  String latitude;
  String longitude;
  DateTime created;
  DateTime updated;

  Kendaraan copyWith({
    int id,
    String nama,
    int jenisKendaraan,
    String noPolisi,
    String kodeKendaraan,
    int jumlahKursi,
    String qrCode,
    String latitude,
    String longitude,
    DateTime created,
    DateTime updated,
  }) =>
      Kendaraan(
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

  factory Kendaraan.fromJson(Map<String, dynamic> json) => Kendaraan(
        id: json["id"] == null ? null : json["id"],
        nama: json["nama"] == null ? null : json["nama"],
        jenisKendaraan:
            json["jenis_kendaraan"] == null ? null : json["jenis_kendaraan"],
        noPolisi: json["no_polisi"] == null ? null : json["no_polisi"],
        kodeKendaraan:
            json["kode_kendaraan"] == null ? null : json["kode_kendaraan"],
        jumlahKursi: json["jumlah_kursi"] == null ? null : json["jumlah_kursi"],
        qrCode: json["qr_code"] == null ? null : json["qr_code"],
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
        "qr_code": qrCode == null ? null : qrCode,
        "latitude": latitude == null ? null : latitude,
        "longitude": longitude == null ? null : longitude,
        "created": created == null ? null : created.toIso8601String(),
        "updated": updated == null ? null : updated.toIso8601String(),
      };
}

class Rute {
  Rute({
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

  Rute copyWith({
    int id,
    String rute,
    String lat1,
    String lon1,
    String lat2,
    String lon2,
    DateTime created,
    DateTime updated,
  }) =>
      Rute(
        id: id ?? this.id,
        rute: rute ?? this.rute,
        lat1: lat1 ?? this.lat1,
        lon1: lon1 ?? this.lon1,
        lat2: lat2 ?? this.lat2,
        lon2: lon2 ?? this.lon2,
        created: created ?? this.created,
        updated: updated ?? this.updated,
      );

  factory Rute.fromJson(Map<String, dynamic> json) => Rute(
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
