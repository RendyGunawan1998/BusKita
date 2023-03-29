// To parse this JSON data, do
//
//     final uangKasModel = uangKasModelFromJson(jsonString);

import 'dart:convert';

List<UangKasModel> uangKasModelFromJson(String str) => List<UangKasModel>.from(
    json.decode(str).map((x) => UangKasModel.fromJson(x)));

String uangKasModelToJson(List<UangKasModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UangKasModel {
  UangKasModel({
    this.gjcode,
    this.gjdate,
    this.amount,
    this.dbCr,
    // this.dbamtbs,
    // this.crmatbs,
    this.gjlastinput,
    this.memo,
    this.receiveby,
    this.refno,
    this.refdate,
  });

  String gjcode;
  DateTime gjdate;
  double amount;
  String dbCr;
  // int dbamtbs;
  // int crmatbs;
  DateTime gjlastinput;
  String memo;
  String receiveby;
  String refno;
  DateTime refdate;

  UangKasModel copyWith({
    String gjcode,
    DateTime gjdate,
    double amount,
    String dbCr,
    // int dbamtbs,
    // int crmatbs,
    DateTime gjlastinput,
    String memo,
    String receiveby,
    String refno,
    DateTime refdate,
  }) =>
      UangKasModel(
        gjcode: gjcode ?? this.gjcode,
        gjdate: gjdate ?? this.gjdate,
        amount: amount ?? this.amount,
        dbCr: dbCr ?? this.dbCr,
        // dbamtbs: dbamtbs ?? this.dbamtbs,
        // crmatbs: crmatbs ?? this.crmatbs,
        gjlastinput: gjlastinput ?? this.gjlastinput,
        memo: memo ?? this.memo,
        receiveby: receiveby ?? this.receiveby,
        refno: refno ?? this.refno,
        refdate: refdate ?? this.refdate,
      );

  factory UangKasModel.fromJson(Map<String, dynamic> json) => UangKasModel(
        gjcode: json["gjcode"] == null ? null : json["gjcode"],
        gjdate: json["gjdate"] == null ? null : DateTime.parse(json["gjdate"]),
        amount: json["amount"] == null ? null : json["amount"],
        dbCr: json["db_cr"] == null ? null : json["db_cr"],
        // dbamtbs: json["dbamtbs"] == null ? null : json["dbamtbs"],
        // crmatbs: json["crmatbs"] == null ? null : json["crmatbs"],
        gjlastinput: json["gjlastinput"] == null
            ? null
            : DateTime.parse(json["gjlastinput"]),
        memo: json["memo"] == null ? null : json["memo"],
        receiveby: json["receiveby"] == null ? null : json["receiveby"],
        refno: json["refno"] == null ? null : json["refno"],
        refdate:
            json["refdate"] == null ? null : DateTime.parse(json["refdate"]),
      );

  Map<String, dynamic> toJson() => {
        "gjcode": gjcode == null ? null : gjcode,
        "gjdate": gjdate == null
            ? null
            : "${gjdate.year.toString().padLeft(4, '0')}-${gjdate.month.toString().padLeft(2, '0')}-${gjdate.day.toString().padLeft(2, '0')}",
        "amount": amount == null ? null : amount,
        "db_cr": dbCr == null ? null : dbCr,
        // "dbamtbs": dbamtbs == null ? null : dbamtbs,
        // "crmatbs": crmatbs == null ? null : crmatbs,
        "gjlastinput":
            gjlastinput == null ? null : gjlastinput.toIso8601String(),
        "memo": memo == null ? null : memo,
        "receiveby": receiveby == null ? null : receiveby,
        "refno": refno == null ? null : refno,
        "refdate": refdate == null
            ? null
            : "${refdate.year.toString().padLeft(4, '0')}-${refdate.month.toString().padLeft(2, '0')}-${refdate.day.toString().padLeft(2, '0')}",
      };
}
