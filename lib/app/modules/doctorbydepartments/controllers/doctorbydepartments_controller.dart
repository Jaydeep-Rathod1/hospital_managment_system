import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospital_managment_system/app/data/repositories/user_repository.dart';
import 'package:hospital_managment_system/app/resources/color_manager.dart';
import 'package:hospital_managment_system/app/resources/url_manager.dart';

class DoctorbydepartmentsController extends GetxController {
  var departmentModel;
  Rx<bool> isLoading = false.obs;
  final UserRepository _userRepository = UserRepository();
  @override
  void onInit() {
    super.onInit();
    print("init controler");
    isLoading.value = true;
    getDataByDoctor();
    isLoading.value = false;

  }
  getDataByDoctor()async{
    final Map<String, dynamic> arguments = Get.arguments;
    if (arguments != null && arguments.containsKey("departmentModel")) {
      departmentModel = arguments["departmentModel"];
      try{
        isLoading.value = true;
        await Future.delayed(Duration(seconds: 10));
        var url = UrlManager.DOCTOR_BY_DEPARTMENT_URL;
        var response = await _userRepository.getDepartments(url);
        if(response['status'] == "true"){


          isLoading.value = false;
        }else{
          isLoading.value = false;
          Get.snackbar(
            'Error',
            "",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: ColorManager.error,
            colorText: ColorManager.white,
            margin: EdgeInsets.all(20),
            duration: Duration(seconds: 3),
          );
        }

      }catch(e){
        isLoading.value = false;
        Get.snackbar(
          'Error',
          "",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: ColorManager.error,
          colorText: ColorManager.white,
          margin: EdgeInsets.all(20),
          duration: Duration(seconds: 3),
        );
      }
    }
  }
}
