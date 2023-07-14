import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:realm_crud/data/models/header_model.dart';
import 'package:realm_crud/db/db_scheme.dart';

abstract class HeaderLocalDatasource {
  List<HeaderModel> getAllHeaders({required int page, required int limit});
  List<HeaderModel> loadModerHeaders({required int page, required int limit});
  String addHeader(HeaderModel headerModel);
  String updateHeader(HeaderModel headerModel);
  String deleteHeader(String headerId);
}

class HeaderLocalDatasourceImpl implements HeaderLocalDatasource {
  final Realm realm;

  HeaderLocalDatasourceImpl(this.realm);

  @override
  List<HeaderModel> getAllHeaders({required int page, required int limit}) {
    final List<HeaderModel> result = [];

    final allItems =
        realm.query<Header>('TRUEPREDICATE SORT(tanggal DESC) Limit($limit)');
    result
        .addAll(allItems.map((header) => HeaderModel.fromHeaderScheme(header)));

    return result;
  }

  @override
  List<HeaderModel> loadModerHeaders({required int page, required int limit}) {
    final List<HeaderModel> result = [];

    final allItems = realm.query<Header>(
        'TRUEPREDICATE SORT(tanggal DESC) Limit(${limit * page})');

    result
        .addAll(allItems.map((header) => HeaderModel.fromHeaderScheme(header)));

    return result.sublist((page - 1) * limit);
  }

  @override
  String addHeader(HeaderModel headerModel) {
    try {
      // _seedDatabase();
      realm.write(() => realm.add<Header>(headerModel.toHeaderScheme()));
    } catch (e) {
      return 'Fail';
    }
    return 'Success';
  }

  @override
  String updateHeader(HeaderModel headerModel) {
    try {
      realm.write(
          () => realm.add<Header>(headerModel.toHeaderScheme(), update: true));
    } catch (e) {
      return 'Fail';
    }
    return 'Success';
  }

  @override
  String deleteHeader(String headerId) {
    try {
      // realm.write(() => realm.deleteAll<Header>());
      final header = realm.find<Header>(ObjectId.fromHexString(headerId));
      realm.write(() => realm.delete(header!));
    } catch (e) {
      debugPrint(e.toString());
      return 'Fail';
    }
    return 'success';
  }

  // void _seedDatabase() {
  //   List<Header> headers =
  //       dummyHeaderList.map((e) => e.toHeaderScheme()).toList();
  //   realm.write(() => realm.addAll(headers));
  // }
}
