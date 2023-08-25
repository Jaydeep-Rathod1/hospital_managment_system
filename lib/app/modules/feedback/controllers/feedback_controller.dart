import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeedbackController extends GetxController {
  Rx<double> selectedRating = 0.0.obs;
  final firstNameController = TextEditingController();
  @override
  void onInit() {
    super.onInit();
  }

  updateRating(upvalue){
    selectedRating.value = upvalue;
  }

  submitForm()async{

  }


}
