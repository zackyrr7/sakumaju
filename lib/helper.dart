import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class Helper {
  // Fungsi untuk mengubah format tanggal
  static String formatTanggal(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    return DateFormat('d MMMM y', 'id_ID')
        .format(dateTime); // Format menjadi 17 September 2024
  }

  // format uang

  static String formatRupiah(double amount) {
    final formatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 2,
    );
    return formatter.format(amount);
  }

  static String formatRupiahFromString(String amountStr) {
    // Mengonversi string menjadi double
    double amount = double.tryParse(amountStr) ?? 0.0;

    // Format angka menjadi format Rupiah
    final formatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 2,
    );
    return formatter.format(amount);
  }

  static Color colorFromHex(String hexColor) {
    // Remove leading '0xff' if present
    if (hexColor.startsWith('0xff')) {
      hexColor = hexColor.substring(2);
    }
    // Add '#' prefix for parsing
    hexColor = hexColor.startsWith('#') ? hexColor : '#$hexColor';
    return Color(int.parse(hexColor.replaceFirst('#', ''), radix: 16));
  }
}
