import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:realm_crud/presentation/controllers/header_bindings.dart';
import 'package:realm_crud/presentation/pages/header_list_page.dart';

void main() {
  initializeDateFormatting('id_ID');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialBinding: HeaderBinding(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
      ),
      home: const HeaderListPage(),
      // getPages: [],
      //   initialRoute: Routes.READPAGE,
      //   initialBinding: ,
      //   defaultTransition: ,
    );
  }
}
