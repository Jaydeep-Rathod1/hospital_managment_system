import 'package:get/get.dart';

import '../controllers/myappointment_controller.dart';

class MyappointmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyappointmentController>(
      () => MyappointmentController(),
    );
  }
}
