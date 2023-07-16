import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospital_managment_system/app/routes/app_pages.dart';

class ResetpasswordController extends GetxController {
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var isPasswordVisible = false.obs;
  var isCPasswordVisible = false.obs;
  final isLoading = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.toggle();
  }
  void toggleCPasswordVisibility() {
    isCPasswordVisible.toggle();
  }


  void submitForm() async{
    if (formKey.currentState!.validate()) {
      // Valid form submission\
      try{
        Get.offNamed(Routes.PASSWORD_CHANGE_SUCEESS);
      }catch(e){
        print('Error occurred: $e');
      }finally{

      }
    } else {
      // Invalid form submission
      print('Invalid form submission');
    }

  }
}
