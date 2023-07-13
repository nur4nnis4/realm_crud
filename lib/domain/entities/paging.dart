import 'package:realm_crud/domain/entities/header_entity.dart';

class Paging {
  Paging({
    required this.totalResults,
    required this.articles,
  });

  int totalResults;
  List<HeaderEntity> articles;
}
