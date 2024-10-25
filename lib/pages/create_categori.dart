import 'package:cashhnote/controller/jenis_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CreateCategoriPage extends StatelessWidget {
  const CreateCategoriPage({super.key});

  @override
  Widget build(BuildContext context) {
    final JenisController controller = Get.put(JenisController());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Kategori"),
          actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.edit))],
        ),
        body: Obx(() {
          if (controller.isloading2.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return const Text('data');
          }
        }),
      ),
    );
  }
}
