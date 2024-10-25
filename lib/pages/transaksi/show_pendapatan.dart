import 'package:cashhnote/constant.dart';
import 'package:cashhnote/controller/transaksi_controller.dart';
import 'package:cashhnote/helper.dart';
import 'package:cashhnote/model/transaksi_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ShowPendapatan extends StatelessWidget {
  const ShowPendapatan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TransaksiController controller = Get.put(TransaksiController());

    // Ambil data transaksi saat aplikasi dibangun
    controller.fetchTransaksi();

    return Scaffold(
      body: Obx(() {
        // Mengelompokkan transaksi berdasarkan tanggal
        var groupedTransaksi = <DateTime, List<TransaksiModel>>{};

        var filteredTransaksi = controller.transaksiList
            .where((transaksi) => transaksi.tipe == 'pemasukan')
            .toList();

        for (var transaksi in filteredTransaksi) {
          if (!groupedTransaksi.containsKey(transaksi.tanggal)) {
            groupedTransaksi[transaksi.tanggal] = [];
          }
          groupedTransaksi[transaksi.tanggal]!.add(transaksi);
        }

        // Menampilkan transaksi
        return ListView.builder(
          itemCount: groupedTransaksi.keys.length,
          itemBuilder: (context, index) {
            var tanggal = groupedTransaksi.keys.elementAt(index);
            var transaksiListPerTanggal = groupedTransaksi[tanggal]!;

            double totalPerTanggal = transaksiListPerTanggal.fold(
              0.0,
              (sum, transaksi) {
                double totalTransaksi = double.tryParse(transaksi.total) ?? 0.0;
                return sum + totalTransaksi;
              },
            );
            // Membuat kolom untuk setiap tanggal
            List<Widget> listTiles = [];
            listTiles.add(
              Container(
                width: ScreenUtil().setWidth(360),
                height: ScreenUtil().setHeight(50),
                color: Colors.blue[50],
                child: Center(
                  child: Text(
                    Helper.formatTanggal(tanggal.toString()), // Format tanggal
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            );

            // Menambahkan ListTile untuk setiap transaksi
            for (var transaksi in transaksiListPerTanggal) {
              listTiles.add(
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                    color: Helper.colorFromHex(transaksi.warna),
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: Colors.black)),
                                height: ScreenUtil().setHeight(35),
                                width: ScreenUtil().setWidth(35),
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Image.network(url2 + (transaksi.icon)),
                                )),
                            SizedBox(
                              width: ScreenUtil().setWidth(5),
                            ),
                            Container(
                              width: ScreenUtil().setWidth(200),
                              child: Text(
                                transaksi.nama,
                                style:
                                    TextStyle(fontSize: ScreenUtil().setSp(15)),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          child: Text(
                            Helper.formatRupiahFromString(transaksi.total),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                    // title: Text(transaksi.nama),
                    // subtitle: Text('Total: ${transaksi.total}'),
                  ),
                ),
              );
            }

            listTiles.add(
              Container(
                width: ScreenUtil().setWidth(360),
                height: ScreenUtil().setHeight(50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      Helper.formatRupiah(totalPerTanggal),
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            );

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: listTiles,
            );
          },
        );
      }),
    );
  }
}
