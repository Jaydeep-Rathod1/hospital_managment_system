import 'package:get/get.dart';

import '../controllers/doctordetails_controller.dart';

class DoctordetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DoctordetailsController>(
      () => DoctordetailsController(),
    );
  }
}
