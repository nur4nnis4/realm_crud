import 'package:realm_crud/domain/repositories/header_repository.dart';

class DeleteHeaderUseCase {
  final HeaderRepository headerRepository;

  DeleteHeaderUseCase(this.headerRepository);

  String call({required String headerId}) =>
      headerRepository.deleteHeader(headerId);
}
