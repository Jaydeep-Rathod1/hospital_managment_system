
import 'dart:async';
import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospital_managment_system/app/data/model/user_model.dart';
import 'package:hospital_managment_system/app/data/repositories/authentication_repository.dart';
import 'package:hospital_managment_system/app/network/error_handler.dart';
import 'package:hospital_managment_system/app/resources/extenstion_manager.dart';
import 'package:hospital_managment_system/app/resources/storage_manager.dart';
import 'package:hospital_managment_system/app/resources/url_manager.dart';
import 'package:hospital_managment_system/app/routes/app_pages.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var isPasswordVisible = false.obs;
  Rx<bool> isLoading = false.obs;
  RoundedLoadingButtonController loginbuttonController =
  RoundedLoadingButtonController();
  final userModel = UserModel().obs;
  final AuthenticationRepository _authenticationRepository = AuthenticationRepository();
  final StorageManager _storage = StorageManager();

  void togglePasswordVisibility() {
    isPasswordVisible.toggle();
  }


  void submitForm() async{
    FocusManager.instance.primaryFocus?.unfocus();
    if (formKey.currentState!.validate()) {
      // Valid form submission\
      // FocusScope.of(Get.focusScope.context).unfocus();
        var email = emailController.text.toString();
        var password = passwordController.text.toString();
        Map<String,dynamic> params = {
          "email":email,
          "password":password
        };
        try{
          isLoading.value = true;
          var url = UrlManager.LOGIN_URL;
          var response = await _authenticationRepository.loginUser(params,url);
          print("response = ${response.toString()}");

          if(response['status'] == "true"){
            var userDetails = response['data'][0];
            userModel.value = UserModel.fromJson(userDetails);
            await _storage.storeModel('userData',userModel.value);
           await _storage.setValue("isLogin", true);
            formKey.currentState?.reset();
            loginbuttonController.success();
            Get.offNamed('/home');
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
        // Get.offAllNamed(Routes.HOME);
    } else {
      loginbuttonController.reset();
    }

  }


}
