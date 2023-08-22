import 'package:get/get.dart';

import '../controllers/addappointment_controller.dart';

class AddappointmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddappointmentController>(
      () => AddappointmentController(),
    );
  }
}
