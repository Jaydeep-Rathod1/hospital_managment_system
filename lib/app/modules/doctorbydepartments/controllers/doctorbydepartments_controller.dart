// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospital_managment_system/app/data/model/deparment_model.dart';
import 'package:hospital_managment_system/app/data/model/user_model.dart';
import 'package:hospital_managment_system/app/data/repositories/user_repository.dart';
import 'package:hospital_managment_system/app/resources/color_manager.dart';
import 'package:hospital_managment_system/app/resources/url_manager.dart';

class DoctorbydepartmentsController extends GetxController {
  DepartmentModel? departmentModel;
  Rx<bool> isLoading = false.obs;
  RxList<UserModel> doctorByDepartmentList = <UserModel>[].obs;
  final UserRepository _userRepository = UserRepository();
  Rx<String> departmentNameTitle = ''.obs;
  final Map<String, dynamic> arguments = Get.arguments;
  @override
  void onInit() {
    super.onInit();
    print("init controler");
    isLoading.value = true;
    if (arguments != null && arguments.containsKey("departmentModel")) {
      departmentModel = arguments["departmentModel"];
      departmentNameTitle.value = departmentModel!.name ?? "";
      refresh();
    }
    getDataByDoctor();


  }



  getDataByDoctor()async{

    if (arguments != null && arguments.containsKey("departmentModel")) {
      departmentModel = arguments["departmentModel"];
      try{

        var url = UrlManager.DOCTOR_BY_DEPARTMENT_URL;
        Map<String,dynamic> params = {
          "department_id" : departmentModel!.departmentId
        };
        var response = await _userRepository.getDoctorByDepartments(url,params);
        if(response['status'] == "true"){
          List<dynamic> data = response['data'];
          doctorByDepartmentList.value =data.map((e) =>UserModel.fromJson(e)).toList();

          isLoading.value = false;
        }else{
          isLoading.value = false;
          // Get.snackbar(
          //   'Error',
          //   "",
          //   snackPosition: SnackPosition.BOTTOM,
          //   backgroundColor: ColorManager.error,
          //   colorText: ColorManager.white,
          //   margin: EdgeInsets.all(20),
          //   duration: Duration(seconds: 3),
          // );
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

  onTapChat()async{
    // await FirebaseFirestore.instance
    //     .collection("Users")
    //     .doc(userdata.uerId.toString())
    //     .collection("Chats")
    //     .doc(arrMatchModel.senderId.toString())
    //     .set({
    //   "bio": arrMatchModel.bio,
    //   "name": arrMatchModel.firstName,
    //   "photo_url":arrMatchModel.photoUrl1,
    //   "is_block":false,
    //   "is_block_by_user":false,
    //   "time_stamp": myTimeStamp,
    // }).whenComplete(() async{
    //   await FirebaseFirestore.instance
    //       .collection("Users")
    //       .doc(arrMatchModel.senderId.toString())
    //       .collection("Chats")
    //       .doc(userdata.uerId.toString())
    //       .set({
    //     "bio": userdata.bio,
    //     "name": userdata.firstname,
    //     "photo_url":userdata.photoUrl1,
    //     "is_block":false,
    //     "is_block_by_user":false,
    //     "time_stamp": myTimeStamp,
    //   });
  }
}
