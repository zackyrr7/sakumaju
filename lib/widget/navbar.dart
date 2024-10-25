import 'package:cashhnote/controller/dashboard_controller.dart';
import 'package:cashhnote/pages/akun_page.dart';
import 'package:cashhnote/pages/analitics_page.dart';
import 'package:cashhnote/pages/create_categori.dart';
import 'package:cashhnote/pages/home_page.dart';
import 'package:cashhnote/pages/tagihan_page.dart';
import 'package:cashhnote/pages/tambah_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyNavbar extends StatefulWidget {

  const MyNavbar({super.key});

  @override
  State<MyNavbar> createState() => _MyNavbarState();
}

class _MyNavbarState extends State<MyNavbar> {
  final DashboardController dashboardController =
      Get.put(DashboardController());

  final PageStorageBucket bucket = PageStorageBucket();

  Widget currentScrren = const DashboardScreen();
  int currentTab = 0;

  final List<Widget> screens = [
    const DashboardScreen(),
    const AnaliticsPage(),
    const TambahPage(),
    const TagihanPage(),
    // const AkunScreen()
    const CreateCategoriPage()
  ];

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    dashboardController.fetchDashboard();
  }
  @override
  
  Widget build(BuildContext context) {

    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: currentScrren,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          setState(() {
            currentScrren = const TambahPage();
            currentTab = 3;
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 12,
        height: ScreenUtil().setHeight(80),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    setState(() {
                      if (dashboardController.dashboardList == '') {
                        dashboardController.fetchDashboard();
                        currentScrren = const DashboardScreen();
                        currentTab = 0;
                      }
                      currentScrren = const DashboardScreen();
                        currentTab = 0;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.home,
                        color: currentTab == 0 ? Colors.blue : Colors.grey,
                      ),
                      Text(
                        "Home",
                        style: TextStyle(
                            color: currentTab == 0 ? Colors.blue : Colors.grey),
                      )
                    ],
                  ),
                ),
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    setState(() {
                      currentScrren = const AnaliticsPage();
                      currentTab = 2;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.analytics_outlined,
                        color: currentTab == 2 ? Colors.blue : Colors.grey,
                      ),
                      Text(
                        "Analisis",
                        style: TextStyle(
                            color: currentTab == 2 ? Colors.blue : Colors.grey),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    setState(() {
                      currentScrren = const TagihanPage();
                      currentTab = 4;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.receipt_long,
                        color: currentTab == 4 ? Colors.blue : Colors.grey,
                      ),
                      Text(
                        "Tagihan",
                        style: TextStyle(
                            color: currentTab == 4 ? Colors.blue : Colors.grey),
                      )
                    ],
                  ),
                ),
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    setState(() {
                      // currentScrren = const CreateCategoriPage();
                      currentScrren = const AkunScreen();
                      currentTab = 5;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.person,
                        color: currentTab == 5 ? Colors.blue : Colors.grey,
                      ),
                      Text(
                        "Akun",
                        style: TextStyle(
                            color: currentTab == 5 ? Colors.blue : Colors.grey),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
