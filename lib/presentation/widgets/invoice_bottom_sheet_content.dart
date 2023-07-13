import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realm_crud/domain/entities/header_entity.dart';
import 'package:realm_crud/presentation/widgets/status_badge.dart';
import 'package:realm_crud/util/time_format.dart';

class InvoiceBSheetContent extends StatelessWidget {
  final HeaderEntity headerEntity;

  const InvoiceBSheetContent({super.key, required this.headerEntity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 32),
      child: Wrap(
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
                        Text(TimeFormat.simplify(headerEntity.tanggal),
                            style: Get.textTheme.subtitle1),
                        const SizedBox(height: 12),
                        Text(
                          headerEntity.catatan,
                          maxLines: 5,
                          style: Get.textTheme.caption,
                        ),
                      ],
                    ),
                  ),
                  StatusBadge(status: headerEntity.status),
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
                rows: headerEntity.detailList
                    .map((e) => DataRow(
                          cells: [
                            DataCell(Text(e.namaBarang)),
                            DataCell(Text('${e.qty}')),
                            DataCell(Text(e.satuan)),
                          ],
                        ))
                    .toList(),
              ),
              // ListView.builder(
              //   itemCount: headerEntity.detailList.length,
              //   shrinkWrap: true,
              //   itemBuilder: (context, i) => Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [],
              //   ),
              // )
            ],
          )
        ],
      ),
    );
  }
}
