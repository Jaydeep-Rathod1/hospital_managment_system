import 'package:get/get.dart';

import '../controllers/doctorbydepartments_controller.dart';

class DoctorbydepartmentsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DoctorbydepartmentsController>(
      () => DoctorbydepartmentsController(),
    );
  }
}
