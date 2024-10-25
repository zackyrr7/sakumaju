import 'package:cashhnote/pages/initiate_page.dart';
import 'package:cashhnote/pages/login_page.dart';
import 'package:get/get.dart';
import 'route_name.dart';


class AppPage {
  static final pages = [
    GetPage(name: RouteName.home, page: ()=> LoginPage()),
    GetPage(name: RouteName.initiate, page: ()=> const InitiatePage())
  ];
}