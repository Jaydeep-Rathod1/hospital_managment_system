import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospital_managment_system/app/data/model/user_model.dart';
import 'package:hospital_managment_system/app/data/repositories/authentication_repository.dart';
import 'package:hospital_managment_system/app/data/repositories/user_repository.dart';
import 'package:hospital_managment_system/app/resources/color_manager.dart';
import 'package:hospital_managment_system/app/resources/font_manager.dart';
import 'package:hospital_managment_system/app/resources/storage_manager.dart';
import 'package:hospital_managment_system/app/resources/url_manager.dart';
import 'package:hospital_managment_system/app/widgets/elevated_button_custom.dart';
import 'package:hospital_managment_system/app/widgets/text_custom.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class EditprofileviewController extends GetxController {
  final AuthenticationRepository _authenticationRepository = AuthenticationRepository();
  RxInt activeCurrentStep = 0.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final mobilenoController = TextEditingController();
  final passwordController = TextEditingController();
  final cpasswordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final dobController = TextEditingController();
  final addressController = TextEditingController();
  var isPasswordVisible = false.obs;
  final userModelStore = UserModel().obs;
  final StorageManager _storage = StorageManager();
  void togglePasswordVisibility() {
    isPasswordVisible.toggle();
  }
  Rx<String> selectedGender = "".obs;
  XFile? _image;
  PickedFile? _pickedFile;
  final _picker = ImagePicker();
  // Implementing the image picker
  final selected = "A+".obs;
  void setSelected(String value){
    selected.value = value;
  }
  void selectGender(gender) {
    selectedGender.value = gender;
  }
  RoundedLoadingButtonController loginbuttonController =
  RoundedLoadingButtonController();
  final FocusNode focusNode = FocusNode();
  Rx<DateTime> selectedStartDate = Rx<DateTime>(DateTime.now());

  Rx<String> imageOninit = "".obs;
  Rx<bool> isSelectImage = false.obs;
  UserModel? userModel;
  Rx<bool> isLoading = false.obs;
  final UserRepository _userRepository = UserRepository();
  Rx<String> departmentNameTitle = ''.obs;
  final Map<String, dynamic> arguments = Get.arguments;
  void onInit() {
    super.onInit();
    print("init controler");
    isLoading.value = true;
    if (arguments != null && arguments.containsKey("userdata")) {
      userModel = arguments["userdata"];
      print("userdata get here = ${userModel!.mobileNo}");
      refresh();
      setDataToEditPage();
    }
  }

  setDataToEditPage()async{
    firstNameController.text = userModel!.firstname ?? "";
    lastNameController.text = userModel!.lastname ?? "";
    mobilenoController.text = userModel!.mobileNo ?? "";
    emailController.text = userModel!.email ?? "";
    addressController.text = userModel!.address ?? "";
    selectedStartDate.value = userModel!.dateOfBirth.toString().isNotEmpty || userModel!.dateOfBirth.toString() != null ? DateTime.parse(userModel!.dateOfBirth.toString()):DateTime.now();
    dobController.text = '${selectedStartDate.value.day}/${selectedStartDate.value.month}/${selectedStartDate.value.year}' ?? "";
    selectedGender.value = userModel!.gender ?? "Male";
    selected.value = userModel!.bloodGroup ?? "A+";
    imageOninit.value = userModel!.profilePicture ?? "";
    isSelectImage.value = false;
  }

  Future<void> selectStartDate(BuildContext context) async {
    focusNode.unfocus();
    final DateTime? pickedDate = await showDatePicker(
      keyboardType: TextInputType.datetime,

      context: context,
      initialDate: selectedStartDate.value,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
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
      isSelectImage.value = true;
    } else {
      // Get.snackbar(
      //   'Error',
      //   'Nothing is selected',
      //   snackPosition: SnackPosition.BOTTOM,
      // );
    }



  }
  submitForm()async{
    if (formKey.currentState!.validate()){
      try{
        print("in try");
        var firstname =firstNameController.value.text.toString();
        var lastname =lastNameController.value.text.toString();
        var email =emailController.value.text.toString();
        var mobileno =mobilenoController.value.text.toString();
        var address =addressController.value.text.toString();
        var dob =selectedStartDate;
        var gender = selectedGender.value.toString();
        var bloodGroup = selected.value.toString();
        var isSelectedImage = isSelectImage.value;
        Map<String,String> params = {
          "user_id": userModel!.userId!,
          "firstname":firstname,
          "lastname":lastname,
          "email":email,
          "mobile_no":mobileno,
          "address":address,
          "date_of_birth":dob.toString(),
          "gender":gender,
          "blood_group":bloodGroup,
          "isSelectedImage":isSelectedImage.toString()
        };
        print("params = ${params}");
        String url = UrlManager.EDIT_PROFILE_URL;
        var response;
        if(isSelectedImage){
           response = await _authenticationRepository.editUser(params,url,"profile_picture",galleryFile.value! );
        }else{
          response = await _authenticationRepository.editUser(params,url,"profile_picture","" );
        }

        print("response = ${response.toString()}");

        if(response['status'] == "true"){
          var userDetails = response['data'];
          userModelStore.value = UserModel.fromJson(userDetails);
          await _storage.storeModel('userData',userModelStore.value);
          loginbuttonController.success();
          formKey.currentState!.reset();
          Get.offAllNamed('/home');
          // Get.offAndToNamed('/home');
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
        loginbuttonController.reset();
      } catch (error) {
        print("Error: $error");
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
    }else{
      print("in else");
      loginbuttonController.reset();
    }
    print("on submut form");
  }
}
