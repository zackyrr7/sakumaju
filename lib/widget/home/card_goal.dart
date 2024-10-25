// ignore_for_file: deprecated_member_use

import 'package:cashhnote/constant.dart';
import 'package:cashhnote/controller/dashboard_controller.dart';
import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CardGoal extends StatelessWidget {
  const CardGoal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final DashboardController controller = Get.put(DashboardController());
    final NumberFormat currencyFormatter =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ');
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
          height: 180,
          child: Obx(() {
            if (controller.isloading2.value) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.dashboardList.value!.goal.length,
                  itemBuilder: (context, index) {
                    var percent = double.parse(controller.dashboardList.value!
                            .goal[index].progressPercentage) /
                        100;

                    String colorString =
                        controller.dashboardList.value!.goal[index].warna;
                    Color bgColor = controller.colorFromHex(colorString);
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                ClipRRect(
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: bgColor),
                                      child: Image.network(
                                        url2 +
                                            (controller.dashboardList?.value
                                                    ?.goal[index].icon ??
                                                ''),
                                        fit: BoxFit.cover,
                                        height: ScreenUtil().setHeight(35),
                                        width: ScreenUtil().setWidth(35),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: ScreenUtil().setWidth(280),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.fromLTRB(8,0,0,8),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              controller.dashboardList.value!
                                                  .goal[index].nama,
                                              style: const TextStyle(
                                                  fontWeight:
                                                      FontWeight.bold),
                                            ),
                                            Text(
                                              currencyFormatter.format(
                                                  double.parse(controller
                                                      .dashboardList
                                                      .value!
                                                      .goal[0]
                                                      .target)),
                                              style: const TextStyle(
                                                  fontWeight:
                                                      FontWeight.bold),
                                            )
                                          ],
                                        ),
                                      ),
                                      Center(
                                        child: LinearPercentIndicator(
                                          barRadius: const Radius.circular(10),
                                          center: Text(
                                              '${controller.dashboardList.value!.goal[index].progressPercentage} %'),
                            
                                          width: ScreenUtil().setWidth(280),
                                          animation: true,
                                          lineHeight: 20.0,
                                          animationDuration: 2000,
                                          percent: percent,
                            
                                          // ignore: duplicate_ignore
                                          // ignore: deprecated_member_use
                                          linearStrokeCap:
                                              LinearStrokeCap.round,
                                          progressColor: Colors.blue[200],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            }
          })),
    );
  }
}
