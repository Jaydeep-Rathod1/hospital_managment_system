
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospital_managment_system/app/data/model/user_model.dart';
import 'package:hospital_managment_system/app/data/repositories/authentication_repository.dart';
import 'package:hospital_managment_system/app/resources/extenstion_manager.dart';
import 'package:hospital_managment_system/app/resources/storage_manager.dart';
import 'package:hospital_managment_system/app/resources/url_manager.dart';
import 'package:hospital_managment_system/app/routes/app_pages.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var isPasswordVisible = false.obs;
  final isLoading = false.obs;
  final userModel = UserModel().obs;
  final AuthenticationRepository _authenticationRepository = AuthenticationRepository();
  final StorageManager _storage = StorageManager();

  void togglePasswordVisibility() {
    isPasswordVisible.toggle();
  }


  void submitForm() async{
    if (formKey.currentState!.validate()) {
      // Valid form submission\

        var email = emailController.text.toString();
        var password = passwordController.text.toString();
        Map<String,dynamic> params = {
          "email":email,
          "password":password
        };
        print(params);
        try{
          isLoading.value = true;
          var url = UrlManager.LOGIN_URL;
          var response = await _authenticationRepository.loginUser(params,url);
          var jsonResonse = jsonDecode(response);
          if(jsonResonse['status'] == "true"){
            var userDetails = jsonResonse['userdata'];
            userModel.value = UserModel.fromJson(userDetails);

            _storage.storeModel('userDetails',userModel.value);
            _storage.setValue("isLogin", true);
            formKey.currentState?.reset();
            Get.offNamed('/home');
          }else{
            isLoading.value = false;
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

          //
        }catch(e){
          isLoading.value = false;
        }
        // Get.offAllNamed(Routes.HOME);
    } else {
      // Invalid form submission
      print('Invalid form submission');
    }

  }


}
