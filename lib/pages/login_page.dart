import 'package:cashhnote/controller/auth_controller.dart';
import 'package:cashhnote/helper.dart';
import 'package:cashhnote/pages/register_page.dart';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final auth = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Helper.colorFromHex('0xff4b49ac'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                width: ScreenUtil().setWidth(90),
                height: ScreenUtil().setHeight(90),
                child: Placeholder(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Text(
                "Selamat Datang di Sakumaju",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Montserrat',
                  fontSize: ScreenUtil().setSp(20),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Text(
              "Masuk dengan mudah",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Montserrat',
                fontSize: ScreenUtil().setSp(18),
              ),
            ),
            Center(
              child: SizedBox(
                width: ScreenUtil().setWidth(300),
                height: ScreenUtil().setHeight(300),
                child: Placeholder(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Text(
                "Username",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Montserrat',
                  fontSize: ScreenUtil().setSp(18),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(
                width: ScreenUtil().setWidth(430),
                child: TextFormField(
                  controller: auth.emailController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(5),
                    fillColor: Colors.white,
                    hintText: 'Username',
                    hintStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: ScreenUtil().setSp(16),
                      color: Colors.black.withOpacity(0.5),
                    ),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.person_pin,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Text(
                textAlign: TextAlign.left,
                "Password",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Montserrat',
                  fontSize: ScreenUtil().setSp(18),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Obx(
              () => SizedBox(
                  width: ScreenUtil().setWidth(430),
                  child: TextField(
                    controller: auth.passwordController,
                    obscureText: auth.hidden.value,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(5),
                      fillColor: Colors.white,
                      hintText: 'Password',
                      hintStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: ScreenUtil().setSp(16),
                        color: Colors.black.withOpacity(0.5),
                      ),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          auth.hidden.toggle();
                        },
                        icon: auth.hidden.isTrue
                            ? Icon(Icons.visibility_off,
                                color: Colors.black.withOpacity(0.5))
                            : const Icon(
                                Icons.visibility,
                                color: Colors.blue,
                              ),
                      ),
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                  )),
            ),
            SizedBox(
              height: ScreenUtil().setHeight(25),
            ),
            SizedBox(
              width: ScreenUtil().setWidth(430),
              child: Obx(
                () => auth.isloading.isTrue
                    ? const Center(child: CircularProgressIndicator())
                    : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          splashFactory: InkRipple.splashFactory,
                          shadowColor: Colors.transparent,
                          side: BorderSide(color: Colors.white),
                          backgroundColor: Helper.colorFromHex('0xff4b49ac'),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        onPressed: () {
                          auth.login(auth.passwordController.text,
                              auth.emailController.text);
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Montserrat',
                            fontSize: ScreenUtil().setSp(16),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
              ),
            ),
            Center(
              child: Text(
                "or",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Montserrat',
                  fontSize: ScreenUtil().setSp(18),
                ),
              ),
            ),
            SizedBox(
              width: ScreenUtil().setWidth(430),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  splashFactory: InkRipple.splashFactory,
                  shadowColor: Colors.transparent,
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () {
                  Get.to(() => RegisterPage());
                },
                child: Text(
                  'Register',
                  style: TextStyle(
                    color: Helper.colorFromHex('0xff4b49ac'),
                    fontFamily: 'Montserrat',
                    fontSize: ScreenUtil().setSp(16),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
