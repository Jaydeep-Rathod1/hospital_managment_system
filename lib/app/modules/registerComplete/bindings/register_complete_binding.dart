import 'package:get/get.dart';

import '../controllers/register_complete_controller.dart';

class RegisterCompleteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterCompleteController>(
      () => RegisterCompleteController(),
    );
  }
}
