import 'package:cashhnote/model/jenis_model.dart';
import 'package:cashhnote/model/transaksi_model.dart';
import 'package:cashhnote/repository/jenis_repository.dart';
import 'package:cashhnote/repository/transaksi_repository.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class TransaksiController extends GetxController {
  var isloading2 = false.obs;
  var transaksiList = <TransaksiModel>[].obs;

  void fetchTransaksi() async {
    try {
      isloading2(true);
      var transaksi = await TransaksiRepository.fetchTransaksi();
      if (transaksi != null) {
        transaksiList.value = transaksi;

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
