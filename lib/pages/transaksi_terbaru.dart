import 'package:cashhnote/controller/dashboard_controller.dart';
import 'package:cashhnote/controller/goal_controller.dart';
import 'package:cashhnote/pages/transaksi/show_pendapatan.dart';
import 'package:cashhnote/pages/transaksi/show_pengeluaran.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TransaksiTerbaruPage extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const TransaksiTerbaruPage();

  @override
  Widget build(BuildContext context) {
    final GoalController tabx = Get.put(GoalController());
    final DashboardController dashboardController =
        Get.put(DashboardController());

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: ScreenUtil().setHeight(35),
        title: Text(
          dashboardController.dashboardList.value!.bulan,
          style: TextStyle(
              fontSize: ScreenUtil().setSp(20), fontWeight: FontWeight.bold,),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        bottom: TabBar(
          indicatorColor: Colors.blue,
          labelColor: Colors.blue,
          controller: tabx.controller,
          tabs: tabx.myTabs,
        ),
      ),
      body: TabBarView(
        controller: tabx.controller,
        children: const [ShowPendapatan(), ShowPengeluaran()],
      ),
    );
  }
}
