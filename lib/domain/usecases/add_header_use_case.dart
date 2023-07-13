import 'package:realm_crud/domain/entities/header_entity.dart';
import 'package:realm_crud/domain/repositories/header_repository.dart';

class AddHeaderUseCase {
  final HeaderRepository headerRepository;

  AddHeaderUseCase(this.headerRepository);

  String call({required HeaderEntity headerEntity}) =>
      headerRepository.addHeader(headerEntity);
}
