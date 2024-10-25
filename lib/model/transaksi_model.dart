// To parse this JSON data, do
//
//     final transaksiModel = transaksiModelFromJson(jsonString);

import 'dart:convert';

List<TransaksiModel> transaksiModelFromJson(String str) =>
    List<TransaksiModel>.from(
        json.decode(str).map((x) => TransaksiModel.fromJson(x)));

String transaksiModelToJson(List<TransaksiModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TransaksiModel {
  String nama;
  String total;
  DateTime tanggal;
  String icon;
  String warna;
  String tipe;

  TransaksiModel({
    required this.nama,
    required this.total,
    required this.tanggal,
    required this.icon,
    required this.warna,
    required this.tipe,
  });

  factory TransaksiModel.fromJson(Map<String, dynamic> json) => TransaksiModel(
        nama: json["nama"],
        total: json["total"],
        tanggal: DateTime.parse(json["tanggal"]),
        icon: json["icon"],
        warna: json["warna"],
        tipe: json["tipe"],
      );

  Map<String, dynamic> toJson() => {
        "nama": nama,
        "total": total,
        "tanggal":
            "${tanggal.year.toString().padLeft(4, '0')}-${tanggal.month.toString().padLeft(2, '0')}-${tanggal.day.toString().padLeft(2, '0')}",
        "icon": icon,
        "warna": warna,
        "tipe": tipe,
      };
}
