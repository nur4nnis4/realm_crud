import 'package:realm_crud/domain/entities/header_entity.dart';
import 'package:realm_crud/domain/repositories/header_repository.dart';

class LoadMoreHeadersUseCase {
  final HeaderRepository headerRepository;

  LoadMoreHeadersUseCase(this.headerRepository);

  List<HeaderEntity> call({required int page, required int limit}) =>
      headerRepository.loadMoreHeaders(page: page, limit: limit);
}
