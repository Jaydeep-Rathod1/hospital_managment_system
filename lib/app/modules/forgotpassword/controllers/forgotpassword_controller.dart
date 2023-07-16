import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospital_managment_system/app/routes/app_pages.dart';

class ForgotpasswordController extends GetxController {
  final emailController = TextEditingController();


  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final isLoading = false.obs;




  void submitForm() async{
    if (formKey.currentState!.validate()) {
      // Valid form submission\
      try{
        Get.offAllNamed(Routes.OTP, arguments: {'isResetPassword': true,});
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
