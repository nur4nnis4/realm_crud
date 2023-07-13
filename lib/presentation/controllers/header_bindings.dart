import 'package:get/get.dart';
import 'package:realm/realm.dart';
import 'package:realm_crud/data/datasources/header_local_datasource.dart';
import 'package:realm_crud/data/repositories/header_repository_impl.dart';
import 'package:realm_crud/db/db_scheme.dart';
import 'package:realm_crud/domain/repositories/header_repository.dart';
import 'package:realm_crud/domain/usecases/add_header_use_case.dart';
import 'package:realm_crud/domain/usecases/delete_header_use_case.dart';
import 'package:realm_crud/domain/usecases/get_all_header_use_case.dart';
import 'package:realm_crud/domain/usecases/update_header_use_case.dart';
import 'package:realm_crud/presentation/controllers/header_controller.dart';

class HeaderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HeaderController(
          getAllHeaderUseCase: Get.find<GetAllHeaderUseCase>(),
          addHeaderUseCase: Get.find<AddHeaderUseCase>(),
          deleteHeaderUseCase: Get.find<DeleteHeaderUseCase>(),
          updateHeaderUseCase: Get.find<UpdateHeaderUseCase>()),
    );

    Get.lazyPut(() => GetAllHeaderUseCase(Get.find<HeaderRepository>()));
    Get.lazyPut(() => AddHeaderUseCase(Get.find<HeaderRepository>()));
    Get.lazyPut(() => DeleteHeaderUseCase(Get.find<HeaderRepository>()));
    Get.lazyPut(() => UpdateHeaderUseCase(Get.find<HeaderRepository>()));

    Get.lazyPut<HeaderRepository>(
        () => HeaderRepositoryImpl(Get.find<HeaderLocalDatasource>()));

    Get.lazyPut<HeaderLocalDatasource>(
        () => HeaderLocalDatasourceImpl(Get.find<Realm>()));

    Get.lazyPut(
        () => Realm(Configuration.local([Header.schema, Detail.schema])));
  }
}
