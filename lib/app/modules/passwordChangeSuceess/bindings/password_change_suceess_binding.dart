import 'package:get/get.dart';

import '../controllers/password_change_suceess_controller.dart';

class PasswordChangeSuceessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PasswordChangeSuceessController>(
      () => PasswordChangeSuceessController(),
    );
  }
}
