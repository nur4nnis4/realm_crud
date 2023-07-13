import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:realm_crud/presentation/controllers/header_controller.dart';

class UpdateDialogContent extends StatelessWidget {
  const UpdateDialogContent({
    Key? key,
    required this.headerController,
    required this.index,
  }) : super(key: key);

  final HeaderController headerController;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextFormField(
          controller: headerController.catatanTFController,
          keyboardType: TextInputType.text,
          maxLines: 5,
          decoration: const InputDecoration(
              labelText: 'Catatan',
              hintMaxLines: 1,
              border: OutlineInputBorder(borderSide: BorderSide(width: 4.0))),
        ),
        const SizedBox(height: 16),
        DropdownButtonFormField(
          value: headerController.headerList[index].status,
          onChanged: (value) => headerController.statusDDController = value!,
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
        const SizedBox(height: 30.0),
        SizedBox(
            width: double.infinity,
            height: 60,
            child: ElevatedButton(
                onPressed: () {
                  Get.back();
                  headerController
                      .updateHeader(headerController.headerList[index]);
                },
                style: ElevatedButton.styleFrom(elevation: 1),
                child: const Text('Update'))),
      ],
    );
  }
}
