import 'package:get/get.dart';

import '../controllers/departments_controller.dart';

class DepartmentsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DepartmentsController>(
      () => DepartmentsController(),
    );
  }
}
