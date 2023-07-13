import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realm_crud/data/models/dummy_data.dart';
import 'package:realm_crud/presentation/controllers/header_controller.dart';
import 'package:realm_crud/presentation/widgets/create_data_content.dart';
import 'package:realm_crud/presentation/widgets/header_list_tile.dart';
import 'package:realm_crud/presentation/widgets/invoice_bottom_sheet_content.dart';

class HeaderListPage extends StatefulWidget {
  const HeaderListPage({super.key});

  @override
  State<HeaderListPage> createState() => _HeaderListPageState();
}

class _HeaderListPageState extends State<HeaderListPage> {
  HeaderController headerController = Get.find();

  @override
  void initState() {
    headerController.getAllHeader();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Realm CRUD',
        ),
        elevation: 0,
        toolbarHeight: kToolbarHeight + 40,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showCreateHeaderBottomSheet(1);
          },
          child: const Icon(Icons.add)),
      body: GetX<HeaderController>(
        init: headerController,
        builder: (_) {
          return ListView.builder(
            itemCount: headerController.headerList.length,
            padding: const EdgeInsets.only(top: 12),
            shrinkWrap: true,
            itemBuilder: (_, i) => HeaderListTile(
              index: i,
              onTap: () {
                showInvoiceBottomSheet(i);
              },
            ),
          );
        },
      ),
    );
  }

  Future<dynamic> showInvoiceBottomSheet(int index) {
    return Get.bottomSheet(
      InvoiceBSheetContent(index: index),
      backgroundColor: Colors.white,
      enableDrag: true,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
    );
  }

  Future<dynamic> showCreateHeaderBottomSheet(int index) {
    return Get.bottomSheet(
      CreateDataContent(),
      backgroundColor: Colors.white,
      enableDrag: true,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
    );
  }
}
