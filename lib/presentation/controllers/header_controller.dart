import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:realm_crud/domain/entities/detail_entity.dart';
import 'package:realm_crud/domain/entities/header_entity.dart';
import 'package:realm_crud/domain/usecases/add_header_use_case.dart';
import 'package:realm_crud/domain/usecases/delete_header_use_case.dart';
import 'package:realm_crud/domain/usecases/get_all_header_use_case.dart';
import 'package:realm_crud/domain/usecases/update_header_use_case.dart';

class HeaderController extends GetxController {
  final GetAllHeaderUseCase getAllHeaderUseCase;
  final AddHeaderUseCase addHeaderUseCase;
  final DeleteHeaderUseCase deleteHeaderUseCase;
  final UpdateHeaderUseCase updateHeaderUseCase;

  final addHeaderformKey = GlobalKey<FormState>();

  final tanggalTFController = TextEditingController();
  final catatanTFController = TextEditingController();

  bool statusDDController = false;

  HeaderController(
      {required this.getAllHeaderUseCase,
      required this.addHeaderUseCase,
      required this.deleteHeaderUseCase,
      required this.updateHeaderUseCase});

  RxList<HeaderEntity> headerList = <HeaderEntity>[].obs;

  RxInt detailFormListLength = 1.obs;
  List<DetailEntity> newDetailList = [];
  int _currentPage = 1;
  final int _pageSize = 20;
  // var _isLoadMore = false;
  // var _paging = Rx<Paging?>(null);

  @override
  void onClose() {
    catatanTFController.dispose();
    tanggalTFController.dispose();
  }

  increaseDetailFormListLength() {
    detailFormListLength++;
    detailFormListLength.refresh();
  }

  decreaseDetailFormListLength() {
    detailFormListLength > 1 ? detailFormListLength-- : detailFormListLength;
    detailFormListLength.refresh();
  }

  addNewDetailList(int index,
      {String? namaBarang, String? qty, String? satuan}) {
    if (newDetailList.length > index) {
      final detail = newDetailList[index];
      newDetailList[index] = DetailEntity(
          id: '',
          namaBarang: namaBarang ?? detail.namaBarang,
          qty: qty != null ? int.parse(qty) : detail.qty,
          satuan: satuan ?? detail.satuan);
    } else {
      newDetailList
          .add(DetailEntity(id: '', namaBarang: '', qty: 0, satuan: ''));
    }
  }

  Future<bool> resetAllFormData() async {
    tanggalTFController.clear();
    catatanTFController.clear();
    statusDDController = false;
    return true;
  }

  void getAllHeader() {
    _currentPage = 1;
    final paginatedHeaderList =
        getAllHeaderUseCase(page: _currentPage, limit: _pageSize);

    headerList.assignAll(paginatedHeaderList);
  }

  addHeader() {
    addHeaderformKey.currentState?.save();

    // print(newDetailList.length);
    // print(newDetailList.first.id);
    // print(newDetailList.first.namaBarang);
    // print(newDetailList.first.qty);
    // print(newDetailList.first.satuan);

    print(tanggalTFController.text);

    final newHeader = HeaderEntity(
        id: '',
        catatan: catatanTFController.text,
        tanggal: DateTime.now(),
        status: statusDDController,
        detailList: newDetailList);
    addHeaderUseCase(newHeader: newHeader);
    headerList.add(newHeader);
  }

  deleteHeader(String headerId) {
    deleteHeaderUseCase(headerId: headerId);
    headerList.removeWhere((header) => header.id == headerId);
  }

  updateHeader(HeaderEntity oldHeaderEntity) {
    final updatedHeader = HeaderEntity(
        id: oldHeaderEntity.id,
        catatan: catatanTFController.text,
        tanggal: oldHeaderEntity.tanggal,
        status: statusDDController,
        detailList: oldHeaderEntity.detailList);

    updateHeaderUseCase(updatedHeader: updatedHeader);
    headerList[headerList.indexWhere(
        (element) => element.id == oldHeaderEntity.id)] = updatedHeader;
    headerList.refresh();
    catatanTFController.clear();
  }

  // loadMore(String keyword) async {
  //   final totalResults = _paging.value?.totalResults ?? 0;
  //   if (totalResults / _pageSize <= _currentPage) return;
  //   if (_isLoadMore) return;
  //   _isLoadMore = true;
  //   _currentPage += 1;
  //   final newPaging = await _fetchNewlineUseCase
  //       .execute(Tuple3(keyword, _currentPage, _pageSize));
  //   articles.addAll(newPaging.articles);
  //   _paging.value?.totalResults = newPaging.totalResults;
  //   _isLoadMore = false;
  // }
}
