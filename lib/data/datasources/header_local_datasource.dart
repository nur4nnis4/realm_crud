import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:realm_crud/data/models/dummy_data.dart';
import 'package:realm_crud/data/models/header_model.dart';
import 'package:realm_crud/db/db_scheme.dart';

abstract class HeaderLocalDatasource {
  List<HeaderModel> getAllHeader({required int page, required int limit});
  String addHeader(HeaderModel headerModel);
  String updateHeader(String id);
  String deleteHeader(String id);
}

class HeaderLocalDatasourceImpl implements HeaderLocalDatasource {
  final Realm realm;

  HeaderLocalDatasourceImpl(this.realm);

  @override
  List<HeaderModel> getAllHeader({required int page, required int limit}) {
    final List<HeaderModel> result = [];

    final allItems = realm.all<Header>();
    result
        .addAll(allItems.map((header) => HeaderModel.fromHeaderScheme(header)));

    return result;
  }

  @override
  String addHeader(HeaderModel headerModel) {
    try {
      realm.write(() => realm.add(headerModel.toHeaderScheme()));
    } catch (e) {
      debugPrint(e.toString());
      return 'Fail';
    }
    return 'Success';
  }

  @override
  String updateHeader(String id) {
    throw UnimplementedError();
  }

  @override
  String deleteHeader(String id) {
    return 'success';
  }

  void seedDatabase() {
    List<Header> headers =
        dummyHeaderList.map((e) => e.toHeaderScheme()).toList();
    realm.write(() => realm.addAll(headers));
  }
}
