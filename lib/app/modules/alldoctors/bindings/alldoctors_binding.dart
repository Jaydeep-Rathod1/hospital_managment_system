import 'package:get/get.dart';

import '../controllers/alldoctors_controller.dart';

class AlldoctorsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AlldoctorsController>(
      () => AlldoctorsController(),
    );
  }
}
