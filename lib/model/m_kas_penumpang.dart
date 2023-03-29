import 'dart:convert';

UangKasPenumpangModel uangKasPenumpangModelFromJson(String str) =>
    UangKasPenumpangModel.fromJson(json.decode(str));

String uangKasPenumpangModelToJson(UangKasPenumpangModel data) =>
    json.encode(data.toJson());

class UangKasPenumpangModel {
  UangKasPenumpangModel({
    this.total,
    this.data,
  });

  String total;
  List<Datum> data;

  UangKasPenumpangModel copyWith({
    String total,
    List<Datum> data,
  }) =>
      UangKasPenumpangModel(
        total: total ?? this.total,
        data: data ?? this.data,
      );

  factory UangKasPenumpangModel.fromJson(Map<String, dynamic> json) =>
      UangKasPenumpangModel(
        total: json["total"] == null ? null : json["total"],
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total == null ? null : total,
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.gjcode,
    this.gjdate,
    this.amount,
    this.dbCr,
    this.dbamtbs,
    this.cramtbs,
    this.gjlastinput,
    this.memo,
    this.receiveby,
    this.refno,
    this.refdate,
    this.userid,
  });

  String gjcode;
  DateTime gjdate;
  double amount;
  String dbCr;
  double dbamtbs;
  double cramtbs;
  DateTime gjlastinput;
  String memo;
  String receiveby;
  String refno;
  DateTime refdate;
  int userid;

  Datum copyWith({
    String gjcode,
    DateTime gjdate,
    double amount,
    String dbCr,
    double dbamtbs,
    double cramtbs,
    DateTime gjlastinput,
    String memo,
    String receiveby,
    String refno,
    DateTime refdate,
    int userid,
  }) =>
      Datum(
        gjcode: gjcode ?? this.gjcode,
        gjdate: gjdate ?? this.gjdate,
        amount: amount ?? this.amount,
        dbCr: dbCr ?? this.dbCr,
        dbamtbs: dbamtbs ?? this.dbamtbs,
        cramtbs: cramtbs ?? this.cramtbs,
        gjlastinput: gjlastinput ?? this.gjlastinput,
        memo: memo ?? this.memo,
        receiveby: receiveby ?? this.receiveby,
        refno: refno ?? this.refno,
        refdate: refdate ?? this.refdate,
        userid: userid ?? this.userid,
      );

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        gjcode: json["gjcode"] == null ? null : json["gjcode"],
        gjdate: json["gjdate"] == null ? null : DateTime.parse(json["gjdate"]),
        amount: json["amount"] == null ? null : json["amount"],
        dbCr: json["db_cr"] == null ? null : json["db_cr"],
        dbamtbs: json["dbamtbs"] == null ? null : json["dbamtbs"],
        cramtbs: json["cramtbs"] == null ? null : json["cramtbs"],
        gjlastinput: json["gjlastinput"] == null
            ? null
            : DateTime.parse(json["gjlastinput"]),
        memo: json["memo"] == null ? null : json["memo"],
        receiveby: json["receiveby"] == null ? null : json["receiveby"],
        refno: json["refno"] == null ? null : json["refno"],
        refdate:
            json["refdate"] == null ? null : DateTime.parse(json["refdate"]),
        userid: json["userid"] == null ? null : json["userid"],
      );

  Map<String, dynamic> toJson() => {
        "gjcode": gjcode == null ? null : gjcode,
        "gjdate": gjdate == null
            ? null
            : "${gjdate.year.toString().padLeft(4, '0')}-${gjdate.month.toString().padLeft(2, '0')}-${gjdate.day.toString().padLeft(2, '0')}",
        "amount": amount == null ? null : amount,
        "db_cr": dbCr == null ? null : dbCr,
        "dbamtbs": dbamtbs == null ? null : dbamtbs,
        "cramtbs": cramtbs == null ? null : cramtbs,
        "gjlastinput":
            gjlastinput == null ? null : gjlastinput.toIso8601String(),
        "memo": memo == null ? null : memo,
        "receiveby": receiveby == null ? null : receiveby,
        "refno": refno == null ? null : refno,
        "refdate": refdate == null
            ? null
            : "${refdate.year.toString().padLeft(4, '0')}-${refdate.month.toString().padLeft(2, '0')}-${refdate.day.toString().padLeft(2, '0')}",
        "userid": userid == null ? null : userid,
      };
}
