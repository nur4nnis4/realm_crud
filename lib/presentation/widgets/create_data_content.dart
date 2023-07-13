import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realm_crud/presentation/controllers/header_controller.dart';
import 'package:realm_crud/util/time_format.dart';

class CreateDataContent extends StatelessWidget {
  final HeaderController headerController = Get.find<HeaderController>();

  CreateDataContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
        child: Wrap(
          children: [
            Form(
              key: headerController.addHeaderformKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Header',
                    style: Get.textTheme.headline5,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: headerController.catatanTFController,
                    keyboardType: TextInputType.text,
                    maxLines: 5,
                    decoration: const InputDecoration(
                        labelText: 'Catatan',
                        hintMaxLines: 1,
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 4.0))),
                  ),
                  const SizedBox(height: 16),
                  DropdownButtonFormField(
                    value: false,
                    onChanged: (value) =>
                        headerController.statusDDController = value!,
                    decoration: InputDecoration(
                      labelText: 'Status',
                      errorMaxLines: 2,
                      contentPadding: const EdgeInsets.all(12),
                      fillColor: Get.theme.dialogTheme.backgroundColor,
                      border: const OutlineInputBorder(),
                      filled: true,
                    ),
                    items: const [
                      DropdownMenuItem<bool>(
                        value: true,
                        child: Text('Lunas'),
                      ),
                      DropdownMenuItem<bool>(
                        value: false,
                        child: Text('Hutang'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      ).then((value) {
                        headerController.tanggalTFController.text =
                            TimeFormat.simplify(value!);
                      });
                    },
                    child: TextFormField(
                      controller: headerController.tanggalTFController,
                      textInputAction: TextInputAction.next,
                      enabled: false,
                      decoration: const InputDecoration(
                          labelText: 'Tanggal',
                          hintMaxLines: 1,
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 4.0))),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Detail',
                        style: Get.textTheme.headline5,
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed:
                                headerController.increaseDetailFormListLength,
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(5),
                            ),
                            child: const Icon(
                              Icons.add,
                              size: 28,
                            ),
                          ),
                          Obx(() => ElevatedButton(
                                onPressed: headerController
                                    .decreaseDetailFormListLength,
                                style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder(),
                                  padding: const EdgeInsets.all(5),
                                  backgroundColor: headerController
                                              .detailFormListLength.value >
                                          1
                                      ? Colors.redAccent
                                      : Colors.grey,
                                ),
                                child: const Icon(
                                  Icons.remove,
                                  size: 28,
                                ),
                              )),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                  Obx(() => ListView.builder(
                        itemCount: headerController.detailFormListLength.value,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, i) {
                          return Column(
                            children: [
                              TextFormField(
                                keyboardType: TextInputType.text,
                                onSaved: (newValue) => headerController
                                    .addNewDetailList(i, namaBarang: newValue!),
                                decoration: const InputDecoration(
                                    labelText: 'Nama Barang',
                                    hintMaxLines: 1,
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(width: 4.0))),
                              ),
                              const SizedBox(height: 16),
                              TextFormField(
                                keyboardType: TextInputType.number,
                                onSaved: (newValue) => headerController
                                    .addNewDetailList(i, qty: newValue!),
                                decoration: const InputDecoration(
                                    labelText: 'Quantity',
                                    hintMaxLines: 1,
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(width: 4.0))),
                              ),
                              const SizedBox(height: 16),
                              TextFormField(
                                keyboardType: TextInputType.text,
                                onSaved: (newValue) => headerController
                                    .addNewDetailList(i, satuan: newValue!),
                                decoration: const InputDecoration(
                                    labelText: 'Satuan',
                                    hintMaxLines: 1,
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(width: 4.0))),
                              ),
                              const SizedBox(height: 14),
                              const Divider(color: Colors.black),
                              const SizedBox(height: 14),
                            ],
                          );
                        },
                      )),
                  const SizedBox(height: 30.0),
                  SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: ElevatedButton(
                          onPressed: () {
                            headerController.addHeader();
                            Get.back();
                          },
                          style: ElevatedButton.styleFrom(elevation: 1),
                          child: const Text('Tambah'))),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
