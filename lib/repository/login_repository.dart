// ignore_for_file: avoid_print

import 'package:cashhnote/constant.dart';
import 'package:cashhnote/controller/dashboard_controller.dart';

import 'package:cashhnote/pages/initiate_page.dart';
import 'package:cashhnote/widget/navbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
class RepositoryLogin {
  Future postLogin(String email, String password) async {
    final DashboardController dashboardController =
      Get.put(DashboardController());
    // ignore: prefer_typing_uninitialized_variables
    var jsonReponse;

    final SharedPreferences sharedPreferences;
    sharedPreferences = await SharedPreferences.getInstance();

    try {
      final response = await http.post(Uri.parse('$url/login'), body: {
        'username': email,
        'password': password,
      });
      if (response.statusCode == 200) {
        jsonReponse = json.decode(response.body);
        print(jsonReponse);

        print(jsonReponse['succes']);
        if (jsonReponse['succes'] == false) {
          showDialog(
              context: Get.context!,
              builder: (context) {
                return SimpleDialog(
                  title: const Text(
                    'Error',
                    textAlign: TextAlign.center,
                  ),
                  alignment: Alignment.center,
                  contentPadding: const EdgeInsets.all(20),
                  children: [
                    Text(
                      jsonReponse['message'],
                      textAlign: TextAlign.center,
                    ),
                    const Center(child: Text('Silahkan Coba lagi')),
                  ],
                );
              });
        } else if (jsonReponse['succes'] == true) {
          sharedPreferences.setString("id", jsonReponse['user_id'].toString());
          dashboardController.fetchDashboard();
          Get.off(const MyNavbar());
        } else if (jsonReponse['status'] == 'new') {
          sharedPreferences.setString("id", jsonReponse['user_id'].toString());
          Get.off(const InitiatePage());
        }
      } else {
        showDialog(
            context: Get.context!,
            builder: (context) {
              return const SimpleDialog(
                title: Text(
                  'Error',
                  textAlign: TextAlign.center,
                ),
                alignment: Alignment.center,
                contentPadding: EdgeInsets.all(20),
                children: [
                  Text(
                    'Terjadi kesalahan',
                    textAlign: TextAlign.center,
                  ),
                  Center(child: Text('Silahkan Coba beberapa saat lagi')),
                ],
              );
            });
      }
    } catch (e) {
      print(e.toString());
      showDialog(
          context: Get.context!,
          builder: (context) {
            return const SimpleDialog(
              title: Text('error'),
            );
          });
    }
  }
}
