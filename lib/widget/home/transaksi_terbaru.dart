import 'package:cashhnote/constant.dart';
import 'package:cashhnote/controller/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TransaksiTerbaru extends StatelessWidget {
  const TransaksiTerbaru({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final DashboardController controller = Get.put(DashboardController());

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: SizedBox(
            height: 200,
            child: Obx(() {
              if (controller.isloading2.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      DateTime tanggal =
                          controller.dashboardList.value!.recent[index].tanggal;
                      var formattedDate =
                          DateFormat('dd-MM-yyyy').format(tanggal);

                      //format uang
                      var uang =
                          controller.dashboardList.value!.recent[index].total;
                      double amount = double.parse(uang);

                      String formattedAmount = NumberFormat.currency(
                              locale: 'id_ID', symbol: 'Rp ', decimalDigits: 2)
                          .format(amount);

                      String colorString =
                          controller.dashboardList.value!.recent[index].warna;
                      Color bgColor = controller.colorFromHex(colorString);

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: bgColor),
                                  child: ClipRRect(
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Image.network(
                                        url2 +
                                            (controller.dashboardList?.value
                                                    ?.recent[index].icon ??
                                                ''),
                                        fit: BoxFit.cover,
                                        height: ScreenUtil().setHeight(35),
                                        width: ScreenUtil().setWidth(35),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: ScreenUtil().setWidth(150),
                                      child: Text(
                                        controller.dashboardList.value!
                                            .recent[index].nama,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Text(
                                      formattedDate,
                                    )
                                  ],
                                )
                              ],
                            ),
                            Text(
                              formattedAmount,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      );
                    });
              }
            })),
      ),
    );
  }
}
