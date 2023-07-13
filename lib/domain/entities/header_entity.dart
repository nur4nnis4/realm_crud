import 'package:realm_crud/domain/entities/detail_entity.dart';

class HeaderEntity {
  final String id;
  final String catatan;
  final DateTime tanggal;
  final bool status;
  final List<DetailEntity> detailList;

  HeaderEntity(
      {required this.id,
      required this.catatan,
      required this.tanggal,
      required this.status,
      required this.detailList});
}
