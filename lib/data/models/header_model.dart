import 'package:realm/realm.dart';
import 'package:realm_crud/data/models/detail_model.dart';
import 'package:realm_crud/db/db_scheme.dart';
import 'package:realm_crud/domain/entities/header_entity.dart';

class HeaderModel extends HeaderEntity {
  HeaderModel(
      {required super.id,
      required super.catatan,
      required super.tanggal,
      required super.status,
      required super.detailList});

  factory HeaderModel.fromHeaderScheme(Header header) => HeaderModel(
      id: header.id.toString(),
      catatan: header.catatan,
      tanggal: header.tanggal,
      status: header.status,
      detailList: header.details.isEmpty
          ? []
          : header.details
              .map((detail) => DetailModel.fromDetailScheme(detail))
              .toList());

  Header toHeaderScheme() => Header(ObjectId(), tanggal, status, catatan,
      details: detailList.isEmpty
          ? []
          : detailList
              .map((e) => Detail(ObjectId(), e.namaBarang, e.qty, e.satuan)));

  factory HeaderModel.fromEntity(HeaderEntity header) => HeaderModel(
      id: header.id.toString(),
      catatan: header.catatan,
      tanggal: header.tanggal,
      status: header.status,
      detailList: header.detailList.isEmpty
          ? []
          : header.detailList
              .map((detail) => DetailModel.fromEntity(detail))
              .toList());
}
