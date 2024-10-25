import 'package:cashhnote/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AkunScreen extends StatefulWidget {
  const AkunScreen({super.key});

  @override
  State<AkunScreen> createState() => _AkunScreenState();
}

class _AkunScreenState extends State<AkunScreen> {
  String? token = '';
  String? idKurir = '';
  String? namaKurir = '';
  String? jumlahUser = '';
  late SharedPreferences sharedPreferences;

  _loadtoken() async {
    sharedPreferences = await SharedPreferences.getInstance();

    setState(() {
      token = (sharedPreferences.getString('token'));
      print(token);
    });
  }

  _loaddatakurir() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      jumlahUser = (sharedPreferences.getString('user'));
      namaKurir = (sharedPreferences.getString('nama'));
      idKurir = (sharedPreferences.getString('id'));
      print(namaKurir);
    });
  }

  @override
  void initState() {
    super.initState();
    _loaddatakurir();
    _loadtoken();
  }
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Akun"),
      ),
      body: SizedBox(
        // color: Colors.amber,
        // padding: EdgeInsets.symmetric(horizontal: 0),
        height: 35,
        // width: 100,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: ElevatedButton.icon(
            onPressed: () {
              _showAlertDialog(context, sharedPreferences);
            },
            label: Text(
              "Keluar",
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.normal),
            ),
            icon: Icon(
              Icons.exit_to_app_rounded,
              size: 18,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}

_showAlertDialog(BuildContext context, sharedPreferences) {
  AlertDialog alert = AlertDialog(
    icon: Icon(
      Icons.warning_rounded,
      size: 50,
      color: Colors.amber,
    ),
    title: const Text(
      "Keluar",
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
    content: Container(
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Apakah Anda Yakin Ingin Keluar Dari Akun Saat Ini?",
            textAlign: TextAlign.center,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Batalkan",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    splashFactory: InkRipple.splashFactory,
                    shadowColor: Colors.transparent,
                    side: BorderSide(color: Colors.black),
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              Expanded(
                flex: 1,
                child: ElevatedButton(
                  onPressed: () {
                    sharedPreferences.clear();
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (BuildContext context) => LoginPage()),
                        (Route<dynamic> route) => false);
                  },
                  child: Text(
                    "Ya, Keluar",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.red),
                  ),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    splashFactory: InkRipple.splashFactory,
                    shadowColor: Colors.transparent,
                    side: BorderSide(color: Colors.red),
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );

  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
