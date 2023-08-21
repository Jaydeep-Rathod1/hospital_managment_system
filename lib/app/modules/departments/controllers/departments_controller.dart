import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hospital_managment_system/app/data/model/deparment_model.dart';
import 'package:hospital_managment_system/app/data/repositories/user_repository.dart';
import 'package:hospital_managment_system/app/resources/color_manager.dart';
import 'package:hospital_managment_system/app/resources/url_manager.dart';
import 'package:hospital_managment_system/app/widgets/custom_loader.dart';



class DepartmentsController extends GetxController {
  RxList<DepartmentModel> departmentList = <DepartmentModel>[].obs;
  Rx<bool> isLoading = false.obs;
  final UserRepository _userRepository = UserRepository();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllDepartments();
  }

  getAllDepartments()async{
    try{
      isLoading.value = true;
      await Future.delayed(Duration(seconds: 10));
      var url = UrlManager.DEPARTMENT_URL;
      var response = await _userRepository.getDepartments(url);
      if(response['status'] == "true"){
        List<dynamic> data = response['data'];
        departmentList.value =data.map((e) =>DepartmentModel.fromJson(e)).toList();
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
