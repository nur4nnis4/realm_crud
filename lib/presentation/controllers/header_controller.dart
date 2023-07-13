import 'package:get/state_manager.dart';
import 'package:realm_crud/domain/entities/header_entity.dart';
import 'package:realm_crud/domain/usecases/add_header_use_case.dart';
import 'package:realm_crud/domain/usecases/delete_header_use_case.dart';
import 'package:realm_crud/domain/usecases/get_all_header_use_case.dart';

class HeaderController extends GetxController {
  final GetAllHeaderUseCase getAllHeaderUseCase;
  final AddHeaderUseCase addHeaderUseCase;
  final DeleteHeaderUseCase deleteHeaderUseCase;

  HeaderController(this.getAllHeaderUseCase, this.addHeaderUseCase,
      this.deleteHeaderUseCase);

  final RxList<HeaderEntity> headerList = <HeaderEntity>[].obs;

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
    addHeaderUseCase(headerEntity: headerEntity);
  }

  deleteHeader(String headerId) {
    deleteHeaderUseCase(headerId: headerId);
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
