import 'package:realm_crud/domain/entities/header_entity.dart';
import 'package:realm_crud/domain/repositories/header_repository.dart';

class GetAllHeaderUseCase {
  final HeaderRepository headerRepository;

  GetAllHeaderUseCase(this.headerRepository);

  List<HeaderEntity> call({required int page, required int limit}) =>
      headerRepository.getAllHeader(page: page, limit: limit);
}
