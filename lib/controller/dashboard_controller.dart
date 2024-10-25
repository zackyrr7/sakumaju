import 'package:cashhnote/model/dashboard_model.dart';
import 'package:cashhnote/repository/dashboard_repository.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class DashboardController extends GetxController {
  var isloading2 = false.obs;
  var dashboardList = Rxn<UserModel>();

  void fetchDashboard() async {
    try {
      isloading2(true);
      var dashboard = await DashboardRepository.fetchDashboard();
      if (dashboard != null) {
        dashboardList.value = dashboard;

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
