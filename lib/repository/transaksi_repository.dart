// ignore_for_file: avoid_print

import 'package:cashhnote/constant.dart';
import 'package:cashhnote/model/dashboard_model.dart';
import 'package:cashhnote/model/transaksi_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class TransaksiRepository {
  static var client = http.Client();

  static Future<List<TransaksiModel>?> fetchTransaksi() async {
    try {
      SharedPreferences prefs =  await SharedPreferences.getInstance();
      var id = prefs.getString('id');

      var response = await http.get(Uri.parse('$url/transaksi/$id'));
      print(response);


      if (response.statusCode == 200) {
        var jsonString = response.body;
        print(jsonString);
        return transaksiModelFromJson(jsonString);
      } else {
        return null;
      }

    } catch (e) {
      print(e);
      rethrow;
    }
  }
}