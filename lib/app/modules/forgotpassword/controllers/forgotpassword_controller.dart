import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospital_managment_system/app/data/repositories/authentication_repository.dart';
import 'package:hospital_managment_system/app/resources/url_manager.dart';
import 'package:hospital_managment_system/app/routes/app_pages.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class ForgotpasswordController extends GetxController {
  final emailController = TextEditingController();

  RoundedLoadingButtonController loginbuttonController =
  RoundedLoadingButtonController();
  final AuthenticationRepository _authenticationRepository = AuthenticationRepository();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final isLoading = false.obs;

  void submitForm() async{
    if (formKey.currentState!.validate()) {

      var email = emailController.text.toString();
      Map<String,dynamic> params = {
        "email":email,
        "action":"sendOtp"
      };
      try{
        isLoading.value = true;
        var url = UrlManager.FORGOTPASSWORD_URL;
        var response = await _authenticationRepository.forgotPassword(params,url);
        print("response = ${response.toString()}");

        if(response['status'] == "true"){
          final dataToSend = {
            'otp':  response['otp'],
            'user_id': response['user_id'],
            'isReset': true
          };
          formKey.currentState?.reset();
          loginbuttonController.success();
          await Future.delayed(Duration(milliseconds: 100)).then((value) {
            Get.toNamed(Routes.OTP,arguments:dataToSend);
            loginbuttonController.reset();
          });

        }else{
          print("in else");
          isLoading.value = false;
          loginbuttonController.reset();
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
        isLoading.value = false;
        loginbuttonController.reset();

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
    } else {
      // Invalid form submission
      print('Invalid form submission');
    }

  }
}
