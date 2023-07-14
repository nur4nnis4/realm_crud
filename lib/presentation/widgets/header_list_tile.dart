import 'package:flutter/material.dart';
import 'package:realm_crud/presentation/controllers/header_controller.dart';
import 'package:realm_crud/presentation/widgets/status_badge.dart';
import 'package:realm_crud/util/time_format.dart';
import 'package:get/get.dart';

class HeaderListTile extends StatelessWidget {
  final int index;
  final Function()? onTap;

  HeaderListTile({super.key, this.onTap, required this.index});

  final HeaderController headerController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      onDismissed: (direction) =>
          headerController.deleteHeader(headerController.headerList[index].id),
      background: Container(
        color: Colors.redAccent.shade200,
      ),
      child: InkWell(
        onTap: onTap,
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          leading: SizedBox.square(
            dimension: 50,
            child: Container(
              color: Get.theme.colorScheme.primary,
              child: Center(
                child: Text(
                  '${index + 1}',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
          title: Text(
              TimeFormat.simplify(headerController.headerList[index].tanggal)),
          subtitle: Text(headerController.headerList[index].catatan,
              maxLines: 2, overflow: TextOverflow.ellipsis),
          trailing:
              StatusBadge(status: headerController.headerList[index].status),
        ),
      ),
    );
  }
}
