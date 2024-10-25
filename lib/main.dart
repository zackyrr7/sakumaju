import 'package:cashhnote/controller/auth_controller.dart';
import 'package:cashhnote/controller/transaksi_controller.dart';
import 'package:cashhnote/pages/login_page.dart';
import 'package:cashhnote/routes/app_page.dart';
import 'package:cashhnote/widget/navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl.dart' as intl;
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID');
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final authC = Get.put(AuthController());
  final transaksiC = Get.put(TransaksiController());

  String id = '';
  _loadid() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      id = (prefs.getString('id') ?? '');
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadid();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
    designSize: Size(430, 932),
      minTextAdapt: true,
      builder: (context, child) {
        if (id == '') {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            home: LoginPage(),
            theme: ThemeData(
                textTheme:
                    GoogleFonts.robotoTextTheme(Theme.of(context).textTheme)),
          );
        } else {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            // home: MyNavbar(),
            home: const MyNavbar(),
            theme: ThemeData(
                textTheme:
                    GoogleFonts.robotoTextTheme(Theme.of(context).textTheme)),
            getPages: AppPage.pages,
          );
        }
      },
    );
  }
}
