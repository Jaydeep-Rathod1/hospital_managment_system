
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospital_managment_system/app/resources/extenstion_manager.dart';
import 'package:hospital_managment_system/app/routes/app_pages.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var isPasswordVisible = false.obs;
  final isLoading = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.toggle();
  }


  void submitForm() async{
    if (formKey.currentState!.validate()) {
      // Valid form submission\
      try{
        Get.offAllNamed(Routes.HOME);
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
