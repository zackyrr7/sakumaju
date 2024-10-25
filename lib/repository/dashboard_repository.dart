// ignore_for_file: avoid_print

import 'package:cashhnote/constant.dart';
import 'package:cashhnote/model/dashboard_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class DashboardRepository {
  static var client = http.Client();

  static Future<UserModel?> fetchDashboard() async {
    try {
      SharedPreferences prefs =  await SharedPreferences.getInstance();
      var id = prefs.getString('id');

      var response = await http.get(Uri.parse('$url/dashboard/$id'));
      print(response);


      if (response.statusCode == 200) {
        var jsonString = response.body;
        print(jsonString);
        return userModelFromJson(jsonString);
      } else {
        return null;
      }

    } catch (e) {
      print(e);
      rethrow;
    }
  }
}