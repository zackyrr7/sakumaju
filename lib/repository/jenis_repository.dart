import 'package:cashhnote/constant.dart';
import 'package:cashhnote/model/jenis_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class JenisRepository {
  static var client = http.Client();

  static Future<List<JenisModel>?> fetchJenis() async {
    try {
      SharedPreferences prefs =  await SharedPreferences.getInstance();
      var id = prefs.getString('id');

      var response = await http.get(Uri.parse('$url/jenis/$id'));
      print(response);


      if (response.statusCode == 200) {
        var jsonString = response.body;
        print(jsonString);
        return jenisModelFromJson(jsonString);
      } else {
        return null;
      }

    } catch (e) {
      print(e);
      rethrow;
    }
  }
}