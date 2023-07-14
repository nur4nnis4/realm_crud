import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:realm_crud/domain/entities/detail_entity.dart';
import 'package:realm_crud/domain/entities/header_entity.dart';
import 'package:realm_crud/domain/usecases/add_header_use_case.dart';
import 'package:realm_crud/domain/usecases/delete_header_use_case.dart';
import 'package:realm_crud/domain/usecases/load_more_headers_use_case.dart';
import 'package:realm_crud/domain/usecases/get_all_header_use_case.dart';
import 'package:realm_crud/domain/usecases/update_header_use_case.dart';

class HeaderController extends GetxController {
  final GetAllHeaderUseCase getAllHeaderUseCase;
  final AddHeaderUseCase addHeaderUseCase;
  final DeleteHeaderUseCase deleteHeaderUseCase;
  final UpdateHeaderUseCase updateHeaderUseCase;
  final LoadMoreHeadersUseCase loadMoreHeadersUseCase;

  final addHeaderformKey = GlobalKey<FormState>();

  final tanggalTFController = TextEditingController();
  final catatanTFController = TextEditingController();

  bool statusDDController = false;

  HeaderController({
    required this.getAllHeaderUseCase,
    required this.addHeaderUseCase,
    required this.deleteHeaderUseCase,
    required this.updateHeaderUseCase,
    required this.loadMoreHeadersUseCase,
  });

  RxList<HeaderEntity> headerList = <HeaderEntity>[].obs;

  RxInt detailFormListLength = 1.obs;
  List<DetailEntity> newDetailList = [];
  int _currentPage = 1;
  final int _limit = 10;
  var isLoadMore = true;

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
        getAllHeaderUseCase(page: _currentPage, limit: _limit);
    headerList.assignAll(paginatedHeaderList);
  }

  addHeader() {
    addHeaderformKey.currentState?.save();

    final newHeader = HeaderEntity(
        id: '',
        catatan: catatanTFController.text,
        tanggal: DateTime.now(),
        status: statusDDController,
        detailList: newDetailList);
    addHeaderUseCase(newHeader: newHeader);
    headerList.insert(0, newHeader);
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

  loadMoreHeaders() async {
    if (isLoadMore) {
      _currentPage++;
      final newPaging =
          loadMoreHeadersUseCase(page: _currentPage, limit: _limit);
      if (_limit > newPaging.length) isLoadMore = false;
      headerList.addAll(newPaging);
    }
  }
}
