import 'package:get/get.dart';

import '../controllers/mydoctors_controller.dart';

class MydoctorsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MydoctorsController>(
      () => MydoctorsController(),
    );
  }
}
