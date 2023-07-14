import 'package:realm_crud/data/datasources/header_local_datasource.dart';
import 'package:realm_crud/data/models/header_model.dart';
import 'package:realm_crud/domain/entities/header_entity.dart';
import 'package:realm_crud/domain/repositories/header_repository.dart';

class HeaderRepositoryImpl implements HeaderRepository {
  final HeaderLocalDatasource headerLocalDatasource;

  HeaderRepositoryImpl(this.headerLocalDatasource);

  @override
  List<HeaderEntity> getAllHeader({required int page, required int limit}) =>
      headerLocalDatasource.getAllHeaders(page: page, limit: limit);

  @override
  List<HeaderEntity> loadMoreHeaders({required int page, required int limit}) =>
      headerLocalDatasource.loadModerHeaders(page: page, limit: limit);

  @override
  String addHeader(HeaderEntity headerEntity) =>
      headerLocalDatasource.addHeader(HeaderModel.fromEntity(headerEntity));

  @override
  String deleteHeader(String headerId) =>
      headerLocalDatasource.deleteHeader(headerId);

  @override
  String updateHeader(HeaderEntity headerEntity) =>
      headerLocalDatasource.updateHeader(HeaderModel.fromEntity(headerEntity));
}
