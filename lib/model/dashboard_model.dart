import 'dart:convert';

// Fungsi untuk mengonversi JSON ke UserModel
UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

// Fungsi untuk mengonversi UserModel ke JSON
String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  Nama nama;
  String bulan;
  String tahun;
  List<Top> top;
  List<Recent> recent;
  List<Goal> goal;
  List<Hutang> hutang;  // Menggunakan List<Hutang> jika ada struktur yang jelas

  UserModel({
    required this.nama,
    required this.bulan,
    required this.tahun,
    required this.top,
    required this.recent,
    required this.goal,
    required this.hutang,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    nama: Nama.fromJson(json["nama"]),
    bulan: json["bulan"],
    tahun: json["tahun"],
    top: List<Top>.from(json["top"].map((x) => Top.fromJson(x))),
    recent: List<Recent>.from(json["recent"].map((x) => Recent.fromJson(x))),
    goal: List<Goal>.from(json["goal"].map((x) => Goal.fromJson(x))),
    hutang: json["hutang"] == null
        ? []
        : List<Hutang>.from(json["hutang"].map((x) => Hutang.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "nama": nama.toJson(),
    "bulan": bulan,
    "tahun": tahun,
    "top": List<dynamic>.from(top.map((x) => x.toJson())),
    "recent": List<dynamic>.from(recent.map((x) => x.toJson())),
    "goal": List<dynamic>.from(goal.map((x) => x.toJson())),
    "hutang": List<dynamic>.from(hutang.map((x) => x.toJson())),
  };
}

class Top {
  String totalPemasukan;
  String totalPengeluaran;
  String bulanan;
  String persenPenggunaan;

  Top({
    required this.totalPemasukan,
    required this.totalPengeluaran,
    required this.bulanan,
    required this.persenPenggunaan,
  });

  factory Top.fromJson(Map<String, dynamic> json) => Top(
    totalPemasukan: json["total_pemasukan"],
    totalPengeluaran: json["total_pengeluaran"],
    bulanan: json["bulanan"],
    persenPenggunaan: json["persen_penggunaan"],
  );

  Map<String, dynamic> toJson() => {
    "total_pemasukan": totalPemasukan,
    "total_pengeluaran": totalPengeluaran,
    "bulanan": bulanan,
    "persen_penggunaan": persenPenggunaan,
  };
}

class Nama {
  String name;

  Nama({
    required this.name,
  });

  factory Nama.fromJson(Map<String, dynamic> json) => Nama(
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
  };
}

class Recent {
  String nama;
  DateTime tanggal;
  String total;
  String icon;
  String warna;
  String tipe;

  Recent({
    required this.nama,
    required this.tanggal,
    required this.total,
    required this.icon,
    required this.warna,
    required this.tipe,
  });

  factory Recent.fromJson(Map<String, dynamic> json) => Recent(
    nama: json["nama"],
    tanggal: DateTime.parse(json["tanggal"]),
    total: json["total"],
    icon: json["icon"],
    warna: json["warna"],
    tipe: json["tipe"],
  );

  Map<String, dynamic> toJson() => {
    "nama": nama,
    "tanggal": "${tanggal.year.toString().padLeft(4, '0')}-${tanggal.month.toString().padLeft(2, '0')}-${tanggal.day.toString().padLeft(2, '0')}",
    "total": total,
    "icon": icon,
    "warna": warna,
    "tipe": tipe,
  };
}

class Goal {
  String goalId;
  String nama;
  String userId;
  String target;
  String status;
  String warna;
  String icon;
  String? total;  // Nullable karena bisa jadi tidak ada
  String progressPercentage;  // Menambahkan progress_percentage

  Goal({
    required this.goalId,
    required this.nama,
    required this.userId,
    required this.target,
    required this.status,
    required this.warna,
    required this.icon,
    this.total,  // Nullable
    required this.progressPercentage,
  });

  factory Goal.fromJson(Map<String, dynamic> json) => Goal(
    goalId: json["goal_id"],
    nama: json["nama"],
    userId: json["user_id"],
    target: json["target"],
    status: json["status"],
    warna: json["warna"],
    icon: json["icon"],
    total: json["total"],
    progressPercentage: json["progress_percentage"],  // Menambahkan progress_percentage
  );

  Map<String, dynamic> toJson() => {
    "goal_id": goalId,
    "nama": nama,
    "user_id": userId,
    "target": target,
    "status": status,
    "warna": warna,
    "icon": icon,
    "total": total,
    "progress_percentage": progressPercentage,  // Menambahkan progress_percentage
  };
}

// Jika Anda tahu struktur Hutang, tambahkan model Hutang
class Hutang {
  // Misalnya jika Hutang memiliki ID dan jumlah
  String id;
  String jumlah;

  Hutang({
    required this.id,
    required this.jumlah,
  });

  factory Hutang.fromJson(Map<String, dynamic> json) => Hutang(
    id: json["id"] ?? '',
    jumlah: json["jumlah"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "jumlah": jumlah,
  };
}
