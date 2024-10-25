import 'package:cashhnote/model/jenis_model.dart';
import 'package:cashhnote/repository/jenis_repository.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class JenisController extends GetxController {
  var isloading2 = false.obs;
  var jenisList = <JenisModel>[].obs;

  void fetchDashboard() async {
    try {
      isloading2(true);
      var jenis = await JenisRepository.fetchJenis();
      if (jenis != null) {
        jenisList.value = jenis;

        // print(dashboardList);
      }
    } finally {
      isloading2(false);
    }
  }

  //UBAH WARNA
  Color colorFromHex(String hexColor) {
    // Remove leading '0xff' if present
    if (hexColor.startsWith('0xff')) {
      hexColor = hexColor.substring(2);
    }
    // Add '#' prefix for parsing
    hexColor = hexColor.startsWith('#') ? hexColor : '#$hexColor';
    return Color(int.parse(hexColor.replaceFirst('#', ''), radix: 16));
  }
}
