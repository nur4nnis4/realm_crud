import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
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

  final catatanTFController = TextEditingController();
  bool statusDDController = false;

  @override
  void onClose() {
    catatanTFController.dispose();
  }

  HeaderController(
      {required this.getAllHeaderUseCase,
      required this.addHeaderUseCase,
      required this.deleteHeaderUseCase,
      required this.updateHeaderUseCase});

  RxList<HeaderEntity> headerList = <HeaderEntity>[].obs;

  int _currentPage = 1;
  final int _pageSize = 20;
  // var _isLoadMore = false;
  // var _paging = Rx<Paging?>(null);

  void getAllHeader() {
    _currentPage = 1;
    final paginatedHeaderList =
        getAllHeaderUseCase(page: _currentPage, limit: _pageSize);

    headerList.assignAll(paginatedHeaderList);
  }

  addHeader(HeaderEntity headerEntity) {
    addHeaderUseCase(newHeader: headerEntity);
    headerList.add(headerEntity);
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
