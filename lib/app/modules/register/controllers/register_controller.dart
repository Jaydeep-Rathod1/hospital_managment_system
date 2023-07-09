import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospital_managment_system/app/resources/color_manager.dart';
import 'package:hospital_managment_system/app/resources/extenstion_manager.dart';
import 'package:hospital_managment_system/app/resources/font_manager.dart';
import 'package:hospital_managment_system/app/widgets/elevated_button_custom.dart';
import 'package:hospital_managment_system/app/widgets/text_custom.dart';
import 'package:hospital_managment_system/app/widgets/textformfield_custom.dart';
import 'package:image_picker/image_picker.dart';

enum Gender {
  male,
  female,
  other,
}

class RegisterController extends GetxController {
  RxInt activeCurrentStep = 0.obs;
  List<GlobalKey<FormState>> formKeys = List.generate(
    3,
        (_) => GlobalKey<FormState>(),
  );
  final emailController = TextEditingController();
  final mobilenoController = TextEditingController();
  final passwordController = TextEditingController();
  final cpasswordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final dobController = TextEditingController();
  final addressController = TextEditingController();
  var isPasswordVisible = false.obs;
  void togglePasswordVisibility() {
    isPasswordVisible.toggle();
  }
  var selectedGender = Gender.male.obs;
  XFile? _image;
  PickedFile? _pickedFile;
  final _picker = ImagePicker();
  // Implementing the image picker
  final selected = "A+".obs;

  void setSelected(String value){
    selected.value = value;
  }
  void selectGender(Gender gender) {
    selectedGender.value = gender;
  }
  final FocusNode focusNode = FocusNode();
  Rx<DateTime> selectedStartDate = Rx<DateTime>(DateTime.now());
  Future<void> selectStartDate(BuildContext context) async {
    focusNode.unfocus();
    final DateTime? pickedDate = await showDatePicker(
      keyboardType: TextInputType.datetime,

      context: context,
      initialDate: selectedStartDate.value,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: ColorManager.primary, // Set your desired color here
              onPrimary: Colors.white,
              surface:  ColorManager.primary, // Set your desired color here
              onSurface: Colors.black,
            ),
          ),
          child: child ?? const SizedBox(),
        );
      },
    );

    if (pickedDate != null) {
      selectedStartDate.value = pickedDate;
      dobController.text = '${selectedStartDate.value.day}/${selectedStartDate.value.month}/${selectedStartDate.value.year}';
    }
  }
  stepState(int step) {
    if (activeCurrentStep > step) {
      return StepState.complete;
    } else {
      return StepState.editing;
    }
  }

  void stepContinue() {
    print(activeCurrentStep.value);
    // if (formKeys[activeCurrentStep.value].currentState!.validate()) {
      if (activeCurrentStep < 3 - 1) {
        activeCurrentStep.value += 1;
      } else {
        activeCurrentStep.value = 0;
      }
    // }

  }
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }else if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    return null; // Return null for no validation errors
  }

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  void stepCancel() {
    if (activeCurrentStep == 0) {
      return;
    } else {
      activeCurrentStep -= 1;
    }

  }

  void stepTapped(int index) {
    activeCurrentStep.value = index;
  }
  void openChooseDialog(){
    Get.dialog(
      AlertDialog(
        title: const CustomText(text: "Choose Image",fontSize: FontSize.s20),
        contentPadding: EdgeInsets.zero,
        content: Padding(
          padding: const EdgeInsets.only(left: 20.0,right: 20,top: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width:Get.mediaQuery.size.width/3.2,
                height: 50,
                child: ElevatedButtonCustom(
                  onPressed:(){
                    Get.back();
                    getImage(ImageSource.camera);
                  },
                  titleText: "Camera",
                  fontSize: FontSize.s16,
                ),
              ),
              SizedBox(
                width:Get.mediaQuery.size.width/3.2,
                height: 50,
                child: ElevatedButtonCustom(
                  onPressed:(){
                    Get.back();
                    getImage(ImageSource.gallery);
                  },
                  titleText: "Gallery",
                  fontSize: FontSize.s16,
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            child: const CustomText(text: "Close",fontSize: FontSize.s16),
            onPressed: () => Get.back(),
          ),
        ],
      ),
    );
  }
  Rx<File?> galleryFile = Rx<File?>(null);
  final picker = ImagePicker();
  Future getImage(ImageSource img) async {
    final pickedFile = await picker.pickImage(source: img);
    XFile? xfilePick = pickedFile;

    if (xfilePick != null) {
      galleryFile.value = File(pickedFile!.path);
    } else {
      Get.snackbar(
        'Error',
        'Nothing is selected',
        snackPosition: SnackPosition.BOTTOM,
      );
    }



  }
}
