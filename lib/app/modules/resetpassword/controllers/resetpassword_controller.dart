import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospital_managment_system/app/data/model/user_model.dart';
import 'package:hospital_managment_system/app/data/repositories/authentication_repository.dart';
import 'package:hospital_managment_system/app/resources/storage_manager.dart';
import 'package:hospital_managment_system/app/resources/url_manager.dart';
import 'package:hospital_managment_system/app/routes/app_pages.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class ResetpasswordController extends GetxController {
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var isPasswordVisible = false.obs;
  var isCPasswordVisible = false.obs;
  RxString userid= "".obs;
  RxBool isReset = false.obs;
  Rx<Map<String, dynamic>> receivedData = Rx<Map<String, dynamic>>({});
  RoundedLoadingButtonController loginbuttonController =
  RoundedLoadingButtonController();
  final AuthenticationRepository _authenticationRepository = AuthenticationRepository();
  final userModel = UserModel().obs;
  final StorageManager _storage = StorageManager();
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    userid.value = receivedData.value['user_id'] ?? '';
    isReset.value =receivedData.value['isReset'] ?? false;
  }

  void togglePasswordVisibility() {
    isPasswordVisible.toggle();
  }
  void toggleCPasswordVisibility() {
    isCPasswordVisible.toggle();
  }


  void submitForm() async{
    print(userid.value);
    if (formKey.currentState!.validate()) {
      // Valid form submission\
      try{
        var password = passwordController.text.toString();
        Map<String,dynamic> params = {
          "password":password,
          "user_id":userid.value
        };
        var url = UrlManager.RESETPASSWORD_URL;
        var response = await _authenticationRepository.resetPassword(params,url);
        if(response['status'] == "true"){
          formKey.currentState?.reset();
          loginbuttonController.success();
          var userDetails = response['data'][0];
          userModel.value = UserModel.fromJson(userDetails);
          await _storage.storeModel('userData',userModel.value);
          await _storage.setValue("isLogin", true);
          await Future.delayed(Duration(milliseconds: 100)).then((value) {
            Get.toNamed(Routes.PASSWORD_CHANGE_SUCEESS);
            loginbuttonController.reset();
          });

        }else{
          print("in else");

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
        // loginbuttonController.success();

        // Get.offNamed(Routes.PASSWORD_CHANGE_SUCEESS);
      }catch(e){
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
