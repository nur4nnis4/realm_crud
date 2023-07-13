import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:realm_crud/presentation/controllers/header_controller.dart';
import 'package:realm_crud/presentation/widgets/status_badge.dart';
import 'package:realm_crud/presentation/widgets/update_dialog_content.dart';
import 'package:realm_crud/util/time_format.dart';

class InvoiceBSheetContent extends StatelessWidget {
  final int index;

  InvoiceBSheetContent({super.key, required this.index});

  final HeaderController headerController = Get.find<HeaderController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
        child: GetX<HeaderController>(
          init: headerController,
          builder: (_) => Wrap(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Invoice',
                              style: Get.textTheme.headline4,
                            ),
                            const SizedBox(height: 12),
                            Text(
                                TimeFormat.simplify(
                                    headerController.headerList[index].tanggal),
                                style: Get.textTheme.subtitle1),
                            const SizedBox(height: 12),
                            Text(
                              headerController.headerList[index].catatan,
                              softWrap: true,
                              style: Get.textTheme.caption,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Row(
                          children: [
                            StatusBadge(
                                status:
                                    headerController.headerList[index].status),
                            const SizedBox(width: 16),
                            IconButton(
                              onPressed: () {
                                showUpdateDialog();
                              },
                              iconSize: 20,
                              splashRadius: 20,
                              padding: const EdgeInsets.all(0),
                              constraints: const BoxConstraints(),
                              icon: Icon(
                                FontAwesomeIcons.solidPenToSquare,
                                color: Get.theme.primaryColor,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 28),
                  DataTable(
                    dataRowHeight: 30,
                    horizontalMargin: 10,
                    dataTextStyle: Get.textTheme.bodySmall,
                    columns: const [
                      DataColumn(
                        label: Text('Nama'),
                      ),
                      DataColumn(
                        label: Text('Qty'),
                      ),
                      DataColumn(
                        label: Text('Satuan'),
                      )
                    ],
                    rows: headerController.headerList[index].detailList
                        .map((e) => DataRow(
                              cells: [
                                DataCell(Text(e.namaBarang)),
                                DataCell(Text('${e.qty}')),
                                DataCell(Text(e.satuan)),
                              ],
                            ))
                        .toList(),
                  ),
                ],
              )
            ],
          ),
        ));
  }

  Future<dynamic> showUpdateDialog() {
    headerController.catatanTFController.text =
        headerController.headerList[index].catatan;
    return Get.defaultDialog(
      title: 'Update Header',
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
      content:
          UpdateDialogContent(headerController: headerController, index: index),
      radius: 10.0,
      onWillPop: headerController.resetAllFormData,
    );
  }
}
