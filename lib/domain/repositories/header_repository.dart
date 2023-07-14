import 'package:realm_crud/domain/entities/header_entity.dart';

abstract class HeaderRepository {
  List<HeaderEntity> getAllHeader({required int page, required int limit});
  List<HeaderEntity> loadMoreHeaders({required int page, required int limit});
  String addHeader(HeaderEntity headerEntity);
  String updateHeader(HeaderEntity headerEntity);
  String deleteHeader(String id);
}
