import 'dart:math';

import 'package:realm_crud/data/models/detail_model.dart';
import 'package:realm_crud/data/models/header_model.dart';

final _random = Random();

DateTime generateRandomDateTime() {
  // Generate a _random year between 2020 and 2023
  int year = _random.nextInt(4) + 2020;

  // Generate a _random month between 1 and 12
  int month = _random.nextInt(12) + 1;

  // Generate a _random day between 1 and the maximum number of days in the month
  int maxDaysInMonth = DateTime(year, month + 1, 0).day;
  int day = _random.nextInt(maxDaysInMonth) + 1;

  // Generate a _random hour between 0 and 23
  int hour = _random.nextInt(24);

  // Generate a _random minute between 0 and 59
  int minute = _random.nextInt(60);

  // Generate a _random second between 0 and 59
  int second = _random.nextInt(60);

  // Generate a _random millisecond between 0 and 999
  int millisecond = _random.nextInt(1000);

  return DateTime(year, month, day, hour, minute, second, millisecond);
}

final List<HeaderModel> dummyHeaderList = [
  HeaderModel(
      id: _random.nextInt(1000000).toString(),
      tanggal: generateRandomDateTime(),
      status: true,
      detailList: generateRandomDetailList(),
      catatan:
          'Random catatan hsdshdg hsdgshdg hsgdshdgs hsgdhsgdyh shdgshdgs hsdgshgd hsgdhsgds'),
  HeaderModel(
      id: _random.nextInt(1000000).toString(),
      tanggal: generateRandomDateTime(),
      status: true,
      detailList: generateRandomDetailList(),
      catatan: 'Random catatan'),
  HeaderModel(
      id: _random.nextInt(1000000).toString(),
      tanggal: generateRandomDateTime(),
      status: false,
      detailList: generateRandomDetailList(),
      catatan: 'Random catatan'),
  HeaderModel(
      id: _random.nextInt(1000000).toString(),
      tanggal: generateRandomDateTime(),
      status: true,
      detailList: generateRandomDetailList(),
      catatan: 'Random catatan'),
  HeaderModel(
      id: _random.nextInt(1000000).toString(),
      tanggal: generateRandomDateTime(),
      status: true,
      detailList: generateRandomDetailList(),
      catatan: 'Random catatan'),
  HeaderModel(
      id: _random.nextInt(1000000).toString(),
      tanggal: generateRandomDateTime(),
      status: true,
      detailList: generateRandomDetailList(),
      catatan: 'Random Catatan'),
  HeaderModel(
      id: _random.nextInt(1000000).toString(),
      tanggal: generateRandomDateTime(),
      status: true,
      detailList: generateRandomDetailList(),
      catatan: 'Random catatan'),
  HeaderModel(
      id: _random.nextInt(1000000).toString(),
      tanggal: generateRandomDateTime(),
      status: false,
      detailList: generateRandomDetailList(),
      catatan: 'Random catatan'),
  HeaderModel(
      id: _random.nextInt(1000000).toString(),
      tanggal: generateRandomDateTime(),
      status: true,
      detailList: generateRandomDetailList(),
      catatan: 'Random catatan'),
  HeaderModel(
      id: _random.nextInt(1000000).toString(),
      tanggal: generateRandomDateTime(),
      status: true,
      detailList: generateRandomDetailList(),
      catatan: 'Random Catatan'),
  HeaderModel(
      id: _random.nextInt(1000000).toString(),
      tanggal: generateRandomDateTime(),
      status: false,
      detailList: generateRandomDetailList(),
      catatan: 'Random catatan'),
  HeaderModel(
      id: _random.nextInt(1000000).toString(),
      tanggal: generateRandomDateTime(),
      status: true,
      detailList: generateRandomDetailList(),
      catatan: 'Random Catatan'),
  HeaderModel(
      id: _random.nextInt(1000000).toString(),
      tanggal: generateRandomDateTime(),
      status: false,
      detailList: generateRandomDetailList(),
      catatan: 'Random catatan'),
];

final List<DetailModel> dummyDetailList = [
  DetailModel(
      id: _random.nextInt(1000000).toString(),
      namaBarang: 'Minyak Goreng',
      qty: 242,
      satuan: 'Kilo'),
  DetailModel(
      id: _random.nextInt(1000000).toString(),
      namaBarang: 'Ikan',
      qty: 296,
      satuan: 'Kilo'),
  DetailModel(
      id: _random.nextInt(1000000).toString(),
      namaBarang: 'Garam',
      qty: 323,
      satuan: 'Kilo'),
  DetailModel(
      id: _random.nextInt(1000000).toString(),
      namaBarang: 'Ikan',
      qty: 296,
      satuan: 'Kilo'),
  DetailModel(
      id: _random.nextInt(1000000).toString(),
      namaBarang: 'Cabe',
      qty: 230,
      satuan: 'Kilo'),
  DetailModel(
      id: _random.nextInt(1000000).toString(),
      namaBarang: 'Pensil',
      qty: 230,
      satuan: 'Buah'),
  DetailModel(
      id: _random.nextInt(1000000).toString(),
      namaBarang: 'Kelapa Sawit',
      qty: 2029,
      satuan: 'Kilo'),
  DetailModel(
      id: _random.nextInt(1000000).toString(),
      namaBarang: 'Udang',
      qty: 323,
      satuan: 'Kilo'),
  DetailModel(
      id: _random.nextInt(1000000).toString(),
      namaBarang: 'Daging Sapi',
      qty: 10,
      satuan: 'Kilo'),
  DetailModel(
      id: _random.nextInt(1000000).toString(),
      namaBarang: 'Telur',
      qty: 2029,
      satuan: 'Butir'),
  DetailModel(
      id: _random.nextInt(1000000).toString(),
      namaBarang: 'Gas',
      qty: 323,
      satuan: 'Kilo'),
  DetailModel(
      id: _random.nextInt(1000000).toString(),
      namaBarang: 'Susu',
      qty: 200,
      satuan: 'Liter'),
  DetailModel(
      id: _random.nextInt(1000000).toString(),
      namaBarang: 'Tahu',
      qty: 323,
      satuan: 'Kilo'),
];

List<DetailModel> generateRandomDetailList() {
  List<DetailModel> randomList = [];

  // Minimum 2 and maximum all details for each header
  for (int i = 0; i < _random.nextInt(dummyDetailList.length) + 3; i++) {
    int randomIndex = _random.nextInt(dummyDetailList.length);
    randomList.add(dummyDetailList[randomIndex]);
  }
  return randomList;
}
