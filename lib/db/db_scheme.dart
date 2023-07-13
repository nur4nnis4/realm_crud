import 'package:realm/realm.dart';

part 'db_scheme.g.dart';

@RealmModel()
class _Header {
  @PrimaryKey()
  late ObjectId id;

  late DateTime tanggal;
  late bool status;
  late String catatan;

  late List<_Detail> details;
}

@RealmModel()
class _Detail {
  @PrimaryKey()
  late ObjectId id;

  late String nama;
  late int qty;
  late String satuan;
}
