import 'package:cashhnote/controller/dashboard_controller.dart';
import 'package:cashhnote/pages/goal_page.dart';
import 'package:cashhnote/pages/transaksi_terbaru.dart';

import 'package:cashhnote/widget/home/card_goal.dart';
import 'package:cashhnote/widget/home/card_home.dart';
import 'package:cashhnote/widget/home/transaksi_terbaru.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DashboardController controller = Get.put(DashboardController());
    // final UserModel? userModel= controller.dashboardList.value;
    return SafeArea(
      child: Scaffold(body: Obx(() {
        if (controller.isloading2.value) {
          return const Center();
        } else {}
        return SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                ),
                height: ScreenUtil().setHeight(60),
                child: Row(
                  children: [
                    SizedBox(
                      height: ScreenUtil().setHeight(50),
                      width: ScreenUtil().setWidth(352),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Image.asset(
                              "assets/icon/user.png",
                              height: ScreenUtil().setHeight(30),
                              width: ScreenUtil().setWidth(30),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text("Hello,"),
                          ),
                          Text(controller.dashboardList.value!.nama.name)
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const card_home(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Transaksi Terbaru",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: ScreenUtil().setSp(15)),
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        Get.to(() => const TransaksiTerbaruPage());
                      },
                      child: const Padding(
                          padding: EdgeInsets.only(right: 10.0),
                          child: Icon(Icons.navigate_next)))
                ],
              ),
              const TransaksiTerbaru(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Goals",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: ScreenUtil().setSp(15)),
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        Get.to(() => const GoalPage());
                      },
                      child: const Padding(
                          padding: EdgeInsets.only(right: 10.0),
                          child: Icon(Icons.navigate_next)))
                ],
              ),
              const CardGoal(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Hutang",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: ScreenUtil().setSp(15)),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 180,
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      child: Image.asset(
                                        'assets/icon/user.png',
                                        height: ScreenUtil().setHeight(35),
                                        width: ScreenUtil().setWidth(35),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Data",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Container(
                                          width: ScreenUtil().setWidth(200),
                                          height: 2,
                                          color: Colors.blue,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const Text('90%')
                            ],
                          ),
                        );
                      }),
                ),
              ),
            ],
          ),
        );
      })),
    );
  }
}
