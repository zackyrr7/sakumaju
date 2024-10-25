// To parse this JSON data, do
//
//     final jenisModel = jenisModelFromJson(jsonString);

import 'dart:convert';

List<JenisModel> jenisModelFromJson(String str) => List<JenisModel>.from(json.decode(str).map((x) => JenisModel.fromJson(x)));

String jenisModelToJson(List<JenisModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class JenisModel {
    String jenisId;
    String nama;
    String tipe;
    String userId;
    String icon;
    String warna;

    JenisModel({
        required this.jenisId,
        required this.nama,
        required this.tipe,
        required this.userId,
        required this.icon,
        required this.warna,
    });

    factory JenisModel.fromJson(Map<String, dynamic> json) => JenisModel(
        jenisId: json["jenis_id"],
        nama: json["nama"],
        tipe: json["tipe"],
        userId: json["user_id"],
        icon: json["icon"],
        warna: json["warna"],
    );

    Map<String, dynamic> toJson() => {
        "jenis_id": jenisId,
        "nama": nama,
        "tipe": tipe,
        "user_id": userId,
        "icon": icon,
        "warna": warna,
    };
}
