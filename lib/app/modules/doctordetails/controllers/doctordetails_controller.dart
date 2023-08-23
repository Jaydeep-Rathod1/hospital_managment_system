import 'package:get/get.dart';
import 'package:hospital_managment_system/app/data/model/user_model.dart';

class DoctordetailsController extends GetxController {
  UserModel? userModel;
  final Map<String, dynamic> arguments = Get.arguments;
  Rx<String> doctorNameTitle = ''.obs;
  @override
  void onInit() {
    super.onInit();
    if (arguments != null && arguments.containsKey("departmentModel")) {
      userModel = arguments["departmentModel"];
      doctorNameTitle.value = userModel!.firstname.toString();
      print("doctor name = ${doctorNameTitle.value}");
      refresh();
    }
  }

  @override
  void onReady() {
    super.onReady();
    if (arguments != null && arguments.containsKey("departmentModel")) {
      userModel = arguments["departmentModel"];
      doctorNameTitle.value = userModel!.firstname.toString();
      refresh();
    }
  }

}
