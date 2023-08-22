import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospital_managment_system/app/data/model/user_model.dart';
import 'package:hospital_managment_system/app/resources/color_manager.dart';
import 'package:hospital_managment_system/app/resources/url_manager.dart';

import '../../../data/repositories/user_repository.dart';

class AlldoctorsController extends GetxController {
  RxList<UserModel> userList = <UserModel>[].obs;
  Rx<bool> isLoading = false.obs;
  final UserRepository _userRepository = UserRepository();
  @override
  void onInit() {
    super.onInit();
    getAllDoctors();
  }
  getAllDoctors()async{
    try{
      isLoading.value = true;

      var url = UrlManager.DOCTOR_ALL;
      var response = await _userRepository.getAllDoctor(url);
      if(response['status'] == "true"){
        List<dynamic> data = response['data'];
        userList.value =data.map((e) =>UserModel.fromJson(e)).toList();
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
