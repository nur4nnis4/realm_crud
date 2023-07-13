import 'package:realm_crud/domain/entities/header_entity.dart';
import 'package:realm_crud/domain/repositories/header_repository.dart';

class UpdateHeaderUseCase {
  final HeaderRepository headerRepository;

  UpdateHeaderUseCase(this.headerRepository);

  String call({required HeaderEntity updatedHeader}) =>
      headerRepository.updateHeader(updatedHeader);
}
