import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realm_crud/data/models/dummy_data.dart';
import 'package:realm_crud/domain/entities/header_entity.dart';
import 'package:realm_crud/presentation/controllers/header_controller.dart';
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
          onPressed: headerController.addHeader(dummyHeaderList[1]),
          child: const Text('+')),
      body: ListView.builder(
        itemCount: headerController.headerList.length,
        padding: const EdgeInsets.only(top: 12),
        shrinkWrap: true,
        itemBuilder: (_, i) => HeaderListTile(
          index: i,
          onTap: () {
            showInvoiceBottomSheet(headerController.headerList[i]);
          },
        ),
      ),
    );
  }

  Future<dynamic> showInvoiceBottomSheet(HeaderEntity headerEntity) {
    return Get.bottomSheet(
      InvoiceBSheetContent(headerEntity: headerEntity),
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
