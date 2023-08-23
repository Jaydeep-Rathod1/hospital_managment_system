import 'package:get/get.dart';

import '../controllers/editprofileview_controller.dart';

class EditprofileviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditprofileviewController>(
      () => EditprofileviewController(),
    );
  }
}
