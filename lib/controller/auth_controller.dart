// ignore: file_names
import 'package:cashhnote/repository/login_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  var hidden = true.obs;
  var isloading = false.obs;
  final RepositoryLogin _repositoryLogin = Get.put(RepositoryLogin());
  String emailError = '';

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  void login(String email, String password) async {
    if (emailController.text != '' && passwordController.text != '') {
      isloading.value = true;
      await _repositoryLogin.postLogin(
          emailController.text, passwordController.text);
      // ignore: unnecessary_null_comparison
      if (_repositoryLogin.postLogin != null) {
        isloading.value = false;
      }
    } else {
      isloading.value = false;
      Get.snackbar(
        'Error',
        "Lengkapi dulu datanya :)",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.blueAccent,
        borderRadius: 20,
        margin: const EdgeInsets.all(15),
        colorText: Colors.white,
        duration: const Duration(seconds: 4),
        isDismissible: true,
        forwardAnimationCurve: Curves.easeOutBack,
      );
    }
  }
}
