import 'package:realm/realm.dart';
import 'package:realm_crud/db/db_scheme.dart';
import 'package:realm_crud/domain/entities/detail_entity.dart';

class DetailModel extends DetailEntity {
  DetailModel(
      {required super.id,
      required super.namaBarang,
      required super.qty,
      required super.satuan});

  factory DetailModel.fromDetailScheme(Detail detail) => DetailModel(
      id: detail.id.toString(),
      namaBarang: detail.nama,
      qty: detail.qty,
      satuan: detail.satuan);

  Detail toDetailScheme() => Detail(ObjectId(), namaBarang, qty, satuan);

  factory DetailModel.fromEntity(DetailEntity detail) => DetailModel(
      id: detail.id.toString(),
      namaBarang: detail.namaBarang,
      qty: detail.qty,
      satuan: detail.satuan);
}
