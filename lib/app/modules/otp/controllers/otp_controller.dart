import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hospital_managment_system/app/data/model/user_model.dart';
import 'package:hospital_managment_system/app/data/repositories/authentication_repository.dart';
import 'package:hospital_managment_system/app/resources/color_manager.dart';
import 'package:hospital_managment_system/app/resources/storage_manager.dart';
import 'package:hospital_managment_system/app/resources/url_manager.dart';
import 'package:hospital_managment_system/app/routes/app_pages.dart';

class OtpController extends GetxController {
  RxString otp= "".obs;
  RxString userid= "".obs;
  RxBool isResetPassword= false.obs;
  RxString matchedString = "".obs;
 Rx<Map<String, dynamic>> receivedData = Rx<Map<String, dynamic>>({});
  final AuthenticationRepository _authenticationRepository = AuthenticationRepository();
  final StorageManager _storage = StorageManager();
  final userModel = UserModel().obs;
  @override
  void onInit() {
    super.onInit();

  }
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    // receivedData.value = Get.arguments;
    otp.value = receivedData.value['otp'].toString() ?? '';
    userid.value = receivedData.value['user_id'] ?? '';
    isResetPassword.value = receivedData.value['isReset'] ?? false;
    if(!isResetPassword.value){
      var userDetails = receivedData.value['userData'];
      userModel.value = UserModel.fromJson(userDetails);
    }
    Get.snackbar(
      'OTP',
      otp.value,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: ColorManager.primary,
      colorText: Colors.white,
      margin: EdgeInsets.all(20),
      duration: Duration(seconds: 3),
    );
    print("otp = ${otp.value}");
    print("isReset = ${isResetPassword.value}");
    print("userid = ${userid.value}");
  }
  submitOTP()async{
    if(isResetPassword.value)
      {
        if(matchedString.value.length == 4){
          if(matchedString.value == otp.value){
            final dataToSend = {
              'user_id': userid.value,
              'isReset':true
            };
            Get.toNamed(Routes.RESETPASSWORD,arguments:dataToSend );
            userid.value = "";
            otp.value = "";
          }else{
            Get.snackbar(
              'Error',
              "Otp not matched",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.red,
              colorText: Colors.white,
              margin: EdgeInsets.all(20),
              duration: Duration(seconds: 3),
            );
          }
        }else{
          Get.snackbar(
            'Error',
            "Please fill otp",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
            margin: EdgeInsets.all(20),
            duration: Duration(seconds: 3),
          );
        }
        // Get.offNamed(Routes.RESETPASSWORD);
      }else{
      Map<String,dynamic> params = {
        "user_id":userid.value,
        "action":"otpmatched"
      };
      try{
        var url = UrlManager.FORGOTPASSWORD_URL;
        var response = await _authenticationRepository.forgotPassword(params,url);
        print("response = ${response.toString()}");

        if(response['status'] == "true"){
          final dataToSend = {
            'user_id': response['user_id'],
            'isReset':false
          };
          Get.offNamed(Routes.RESETPASSWORD,arguments: dataToSend);
          otp.value = "";
        }else{
          Get.snackbar(
            'Error',
            response['message'],
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
            margin: EdgeInsets.all(20),
            duration: Duration(seconds: 3),
          );
        }
      } catch (error) {
        print("Error: $error");
        Get.snackbar(
          'Error',
          "",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          margin: EdgeInsets.all(20),
          duration: Duration(seconds: 3),
        );
      }


    }
  }
  resendOtp()async{

    Map<String,dynamic> params = {
      "user_id":userid.value,
      "action":"resendOtp"
    };
    try{

      var url = UrlManager.FORGOTPASSWORD_URL;
      var response = await _authenticationRepository.forgotPassword(params,url);
      print("response = ${response.toString()}");

      if(response['status'] == "true"){
        otp.value = response['otp'].toString();
        userid.value = response['user_id'];
        Get.snackbar(
          'OTP',
          otp.value,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: ColorManager.primary,
          colorText: Colors.white,
          margin: EdgeInsets.all(20),
          duration: Duration(seconds: 3),
        );

      }else{
        print("in else");

        Get.snackbar(
          'Error',
          response['message'],
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          margin: EdgeInsets.all(20),
          duration: Duration(seconds: 3),
        );
      }
    } catch (error) {
      print("Error: $error");


      Get.snackbar(
        'Error',
        "",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        margin: EdgeInsets.all(20),
        duration: Duration(seconds: 3),
      );
    }
  }

}
