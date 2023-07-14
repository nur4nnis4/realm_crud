import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  final _scrollController = ScrollController();
  HeaderController headerController = Get.find();

  _scrollListener() {
    if (_scrollController.position.maxScrollExtent ==
        _scrollController.position.pixels) {
      headerController.loadMoreHeaders();
    }
  }

  @override
  void initState() {
    headerController.getAllHeader();
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetX<HeaderController>(
      init: headerController,
      builder: (_) {
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
            body: ListView.builder(
              controller: _scrollController,
              itemCount: headerController.headerList.length + 1,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              shrinkWrap: true,
              itemBuilder: (_, i) {
                if (i < headerController.headerList.length) {
                  return HeaderListTile(
                      index: i,
                      onTap: () {
                        showInvoiceBottomSheet(i);
                      });
                } else {
                  return headerController.isLoadMore
                      ? const Padding(
                          padding: EdgeInsets.only(bottom: 40),
                          child: Center(child: CircularProgressIndicator()),
                        )
                      : Container();
                }
              },
            ));
      },
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
