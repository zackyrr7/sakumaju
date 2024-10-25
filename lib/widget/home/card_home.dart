import 'package:cashhnote/controller/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';
import 'package:intl/intl.dart';

// ignore: camel_case_types
class card_home extends StatelessWidget {
  const card_home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final DashboardController controller = Get.put(DashboardController());
    var percent =
        double.parse(controller.dashboardList.value!.top[0].persenPenggunaan) /
            100;
    final NumberFormat currencyFormatter =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ');

    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Card(
          color: Colors.blue,
          child: Obx(() {
            if (controller.isloading2.value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return SizedBox(
                // height: ScreenUtil().setHeight(200),
                width: ScreenUtil().setWidth(300),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.apps_rounded),
                          color: Colors.white,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Text(
                            controller.dashboardList.value!.bulan,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: ScreenUtil().setSp(15)),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Mounthly Budget",
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  currencyFormatter.format(double.parse(
                                      controller.dashboardList.value!.top[0]
                                          .bulanan)),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                              height: ScreenUtil().setHeight(20),
                              child: LiquidLinearProgressIndicator(
                                value: percent, // Defaults to 0.5.
                                valueColor: const AlwaysStoppedAnimation(Colors
                                    .blue), // Defaults to the current Theme's accentColor.
                                backgroundColor: Colors
                                    .white, // Defaults to the current Theme's backgroundColor.
                                borderColor:
                                    const Color.fromARGB(255, 255, 255, 255),
                                borderWidth: 1.0,
                                borderRadius: 12.0,
                                direction: Axis
                                    .horizontal, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.horizontal.
                                center: Text(
                                  '${controller.dashboardList.value!.top[0].persenPenggunaan} %',
                                ),
                              )),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.greenAccent,
                                      borderRadius: BorderRadius.circular(10)),
                                  height: ScreenUtil().setHeight(80),
                                  width: ScreenUtil().setWidth(125),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "Pendapatan",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: Text(
                                                currencyFormatter.format(
                                                    double.parse(controller
                                                        .dashboardList
                                                        .value!
                                                        .top[0]
                                                        .totalPemasukan)),
                                                style: TextStyle(
                                                    fontSize:
                                                        ScreenUtil().setSp(15),
                                                    color: Colors.black),
                                              ))
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.red[400],
                                      borderRadius: BorderRadius.circular(10)),
                                  height: ScreenUtil().setHeight(80),
                                  width: ScreenUtil().setWidth(125),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "Pengeluaran",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: Text(
                                                currencyFormatter.format(
                                                    double.parse(controller
                                                        .dashboardList
                                                        .value!
                                                        .top[0]
                                                        .totalPengeluaran)),
                                                style: TextStyle(
                                                    fontSize:
                                                        ScreenUtil().setSp(15),
                                                    color: Colors.black),
                                              ))
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            }
          })),
    );
  }
}
