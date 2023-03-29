// To parse this JSON data, do
//
//     final perjalananModel = perjalananModelFromJson(jsonString);

import 'dart:convert';

List<PerjalananModel> perjalananModelFromJson(String str) =>
    List<PerjalananModel>.from(
        json.decode(str).map((x) => PerjalananModel.fromJson(x)));

String perjalananModelToJson(List<PerjalananModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PerjalananModel {
  PerjalananModel({
    this.id,
    this.kendaraan,
    this.rute,
    this.hargaTiket,
    this.pengemudi,
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
  int pengemudi;
  int sisaKursi;
  DateTime waktuKeberangkatan;
  DateTime perkiraanWaktuTiba;
  bool selesai;
  dynamic waktuTiba;
  String kodePerjalanan;
  DateTime created;
  DateTime updated;

  PerjalananModel copyWith({
    int id,
    Kendaraan kendaraan,
    Rute rute,
    String hargaTiket,
    int pengemudi,
    int sisaKursi,
    DateTime waktuKeberangkatan,
    DateTime perkiraanWaktuTiba,
    bool selesai,
    dynamic waktuTiba,
    String kodePerjalanan,
    DateTime created,
    DateTime updated,
  }) =>
      PerjalananModel(
        id: id ?? this.id,
        kendaraan: kendaraan ?? this.kendaraan,
        rute: rute ?? this.rute,
        hargaTiket: hargaTiket ?? this.hargaTiket,
        pengemudi: pengemudi ?? this.pengemudi,
        sisaKursi: sisaKursi ?? this.sisaKursi,
        waktuKeberangkatan: waktuKeberangkatan ?? this.waktuKeberangkatan,
        perkiraanWaktuTiba: perkiraanWaktuTiba ?? this.perkiraanWaktuTiba,
        selesai: selesai ?? this.selesai,
        waktuTiba: waktuTiba ?? this.waktuTiba,
        kodePerjalanan: kodePerjalanan ?? this.kodePerjalanan,
        created: created ?? this.created,
        updated: updated ?? this.updated,
      );

  factory PerjalananModel.fromJson(Map<String, dynamic> json) =>
      PerjalananModel(
        id: json["id"] == null ? null : json["id"],
        kendaraan: json["kendaraan"] == null
            ? null
            : Kendaraan.fromJson(json["kendaraan"]),
        rute: json["rute"] == null ? null : Rute.fromJson(json["rute"]),
        hargaTiket: json["harga_tiket"] == null ? null : json["harga_tiket"],
        pengemudi: json["pengemudi"] == null ? null : json["pengemudi"],
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
        "pengemudi": pengemudi == null ? null : pengemudi,
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

  Kendaraan copyWith({
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
      Kendaraan(
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
  dynamic created;
  dynamic updated;

  Rute copyWith({
    int id,
    String rute,
    String lat1,
    String lon1,
    String lat2,
    String lon2,
    dynamic created,
    dynamic updated,
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
        id: json["id"],
        rute: json["rute"],
        lat1: json["lat1"],
        lon1: json["lon1"],
        lat2: json["lat2"],
        lon2: json["lon2"],
        created: json["created"],
        updated: json["updated"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "rute": rute,
        "lat1": lat1,
        "lon1": lon1,
        "lat2": lat2,
        "lon2": lon2,
        "created": created,
        "updated": updated,
      };
}

class Keberangkatan {
  Keberangkatan({
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

  Keberangkatan copyWith({
    int id,
    String nama,
    String kodeTerminal,
    String alamat,
    String latitude,
    String longitude,
    DateTime created,
    DateTime updated,
  }) =>
      Keberangkatan(
        id: id ?? this.id,
        nama: nama ?? this.nama,
        kodeTerminal: kodeTerminal ?? this.kodeTerminal,
        alamat: alamat ?? this.alamat,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        created: created ?? this.created,
        updated: updated ?? this.updated,
      );

  factory Keberangkatan.fromJson(Map<String, dynamic> json) => Keberangkatan(
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
