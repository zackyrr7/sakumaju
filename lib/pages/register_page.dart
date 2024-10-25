import 'package:cashhnote/controller/auth_controller.dart';
import 'package:cashhnote/helper.dart';
import 'package:cashhnote/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
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
              "Daftar dengan mudah",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Montserrat',
                fontSize: ScreenUtil().setSp(18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0, top: 15),
              child: Text(
                "Nama Lengkap",
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
                  hintText: 'Nama Lengkap',
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
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0, top: 15),
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
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0, top: 15),
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
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0, top: 15),
              child: Text(
                textAlign: TextAlign.left,
                "Konfirmasi Password",
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
            Row(
              children: [
                Text(
                  "Sudah Punya Akun?",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Montserrat',
                    fontSize: ScreenUtil().setSp(16),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => LoginPage());
                  },
                  child: Text(
                    " Login",
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontFamily: 'Montserrat',
                      fontSize: ScreenUtil().setSp(16),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
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
                          'Register',
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
            Text(
              "Sudah Punya Akun?",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Montserrat',
                fontSize: ScreenUtil().setSp(16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
