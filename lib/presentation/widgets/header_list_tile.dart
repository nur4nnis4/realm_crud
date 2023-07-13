import 'package:flutter/material.dart';
import 'package:realm_crud/domain/entities/header_entity.dart';
import 'package:realm_crud/presentation/controllers/header_controller.dart';
import 'package:realm_crud/presentation/widgets/status_badge.dart';
import 'package:realm_crud/util/time_format.dart';
import 'package:get/get.dart';

class HeaderListTile extends StatelessWidget {
  final int headerId;
  final Function()? onTap;

  HeaderListTile({super.key, this.onTap, required this.headerId});

  final HeaderController headerController = Get.find();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        leading: SizedBox.square(
          dimension: 50,
          child: Container(
            color: Get.theme.colorScheme.primary,
            child: Center(
              child: Text(
                '${headerId + 1}',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
        title: Text(
            TimeFormat.simplify(headerController.headerList[headerId].tanggal)),
        subtitle: Text(headerController.headerList[headerId].catatan),
        trailing:
            StatusBadge(status: headerController.headerList[headerId].status),
      ),
    );
  }
}
