import 'package:get/get.dart';
import 'package:hospital_managment_system/app/data/model/user_model.dart';

class DoctordetailsController extends GetxController {

  UserModel? usermodel;
  Rx<bool> isLoading = false.obs;
  Rx<String> departmentNameTitle = ''.obs;
  final Map<String, dynamic> arguments = Get.arguments;
  @override
  void onInit() {
    super.onInit();
    print("init controler");
    // isLoading.value = true;
    if (arguments != null && arguments.containsKey("userData")) {
      usermodel = arguments["userData"];
      departmentNameTitle.value = "Dr. ${usermodel!.firstname} ${usermodel!.lastname}" ?? "";
      refresh();
      // isLoading.value = true;
    }



  }
}
