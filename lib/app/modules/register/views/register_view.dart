import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hospital_managment_system/app/resources/color_manager.dart';
import 'package:hospital_managment_system/app/resources/extenstion_manager.dart';
import 'package:hospital_managment_system/app/resources/font_manager.dart';
import 'package:hospital_managment_system/app/routes/app_pages.dart';
import 'package:hospital_managment_system/app/widgets/elevated_button_custom.dart';
import 'package:hospital_managment_system/app/widgets/rounded_loading_button.dart';
import 'package:hospital_managment_system/app/widgets/text_custom.dart';
import 'package:hospital_managment_system/app/widgets/textformfield_custom.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset:false,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade50,
        elevation: 0,

        title: CustomText(text: 'Registration',fontSize: 18,color: ColorManager.primary,),
        iconTheme: IconThemeData(
          color: ColorManager.primary, //change your color here
        ),
      ),
      body: Obx(
            () => Stepper(
          elevation: 0.0,
          type: StepperType.horizontal,
          currentStep: controller.activeCurrentStep.value,
          margin: EdgeInsets.zero,
          steps: [
            Step(
              label: CustomText( text: 'Contact' ,
                color:controller.activeCurrentStep == 0? ColorManager.primary:ColorManager.black,
                textAlign: TextAlign.center,
              ),
              title: const SizedBox.shrink(),
              content: Form(
                key: controller.formKeys[0],
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "First Name",
                        maxLines: 2,
                        textStyle: Get.theme.textTheme.bodyMedium!.copyWith(
                            fontSize: FontSize.s14,
                            fontWeight: FontWeight.w500
                        ),
                        letterSpacing: 2,
                        // textStyle:
                      ),
                      TextFormFieldCustom(
                        textController: controller.firstNameController,
                        hintText: "First Name",
                        keyboardType: TextInputType.emailAddress,
                        // validator: (value) => value!.validateEmail(),
                      ),
                      CustomText(
                        text: "Last Name",
                        maxLines: 2,
                        textStyle: Get.theme.textTheme.bodyMedium!.copyWith(
                            fontSize: FontSize.s14,
                            fontWeight: FontWeight.w500
                        ),
                        letterSpacing: 2,
                        // textStyle:
                      ),
                      TextFormFieldCustom(
                        textController: controller.lastNameController,
                        hintText: "Last Name",
                        keyboardType: TextInputType.emailAddress,
                        // validator: (value) => value!.validateEmail(),
                      ),
                      CustomText(
                        text: "Mobile No",
                        maxLines: 2,
                        textStyle: Get.theme.textTheme.bodyMedium!.copyWith(
                            fontSize: FontSize.s14,
                            fontWeight: FontWeight.w500
                        ),
                        letterSpacing: 2,
                        // textStyle:
                      ),
                      TextFormFieldCustom(
                        textController: controller.mobilenoController,
                        hintText: "Mobile No",
                        keyboardType: TextInputType.phone,
                        validator: (value) => value!.validateMobileNumber(),
                      ),

                      CustomText(
                        text: "Email",
                        maxLines: 2,
                        textStyle: Get.theme.textTheme.bodyMedium!.copyWith(
                            fontSize: FontSize.s14,
                            fontWeight: FontWeight.w500
                        ),
                        letterSpacing: 2,
                        // textStyle:
                      ),
                      TextFormFieldCustom(
                        textController: controller.emailController,
                        hintText: "Email",
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) => value!.validateEmail(),
                      ),
                    ],
                  ),
                ),
              ),
              state: controller.stepState(0),
              isActive: controller.activeCurrentStep == 0,

            ),
            Step(
              label: CustomText( text: 'Personal',color:controller.activeCurrentStep == 1? ColorManager.primary:ColorManager.black,),
              title: SizedBox.shrink(),
              content: Form(
                key: controller.formKeys[1],
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "Address",
                        maxLines: 2,
                        textStyle: Get.theme.textTheme.bodyMedium!.copyWith(
                            fontSize: FontSize.s14,
                            fontWeight: FontWeight.w500
                        ),
                        letterSpacing: 2,
                        // textStyle:
                      ),
                      TextFormFieldCustom(
                        textController: controller.addressController,
                        hintText: "Enter Address",
                        keyboardType: TextInputType.text,
                        maxLines: 4,
                        // validator: (value) => value!.validateEmail(),
                      ),
                      CustomText(
                        text: "Gender",

                        textStyle: Get.theme.textTheme.bodyMedium!.copyWith(
                            fontSize: FontSize.s14,
                            fontWeight: FontWeight.w500
                        ),
                        letterSpacing: 2,
                        // textStyle:
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            flex:1,
                            child: RadioListTile(
                              title: CustomText( text: 'Male', textStyle: Get.theme.textTheme.bodyMedium!.copyWith(
                                fontSize: FontSize.s16,
                              ),),
                              // titlePadding: EdgeInsets.zero,
                              value: "Male",
                              contentPadding: EdgeInsets.zero,
                              groupValue: controller.selectedGender.value,
                              selectedTileColor: ColorManager.primary,
                              activeColor: ColorManager.primary,
                              onChanged: (value) {
                                controller.selectGender(value!);
                              },

                            ),
                          ),
                          Expanded(
                            flex:1,
                            child: RadioListTile(
                              title: CustomText( text: 'Female', textStyle: Get.theme.textTheme.bodyMedium!.copyWith(
                                fontSize: FontSize.s16,
                              ),),
                              contentPadding: EdgeInsets.zero,
                              value: "Female",
                              groupValue: controller.selectedGender.value,
                              selectedTileColor: ColorManager.primary,
                              activeColor: ColorManager.primary,
                              onChanged: (value) {
                                controller.selectGender(value!);
                              },
                            ),
                          ),
                          Expanded(
                            // width:100,
                            flex:1,
                            child: RadioListTile(
                              title: CustomText( text: 'Other', textStyle: Get.theme.textTheme.bodyMedium!.copyWith(
                                fontSize: FontSize.s16,
                              ),),
                              value: "Other",
                              selectedTileColor: ColorManager.primary,
                              activeColor: ColorManager.primary,
                              contentPadding: EdgeInsets.zero,
                              groupValue: controller.selectedGender.value,
                              onChanged: (value) {
                                controller.selectGender(value!);
                              },
                            ),
                          ),
                        ],
                      ),
                      CustomText(
                        text: "Date Of Birth",
                        maxLines: 2,
                        textStyle: Get.theme.textTheme.bodyMedium!.copyWith(
                            fontSize: FontSize.s14,
                            fontWeight: FontWeight.w500
                        ),
                        letterSpacing: 2,
                        // textStyle:
                      ),
                      TextFormFieldCustom(
                        textController: controller.dobController,
                        hintText: "Choose Date Of Birth",
                        keyboardType: TextInputType.text,
                        readOnly: true,

                        onTap: ()async{
                          controller.selectStartDate(context);
                        },
                        // validator: (value) => value!.validateEmail(),
                      ),
                    ],
                  ),
                ),
              ),
              state: controller.stepState(1),
              isActive: controller.activeCurrentStep == 1,
            ),
            Step(
              label: CustomText( text: 'Additional',color:controller.activeCurrentStep == 2? ColorManager.primary:ColorManager.black,),
              title: SizedBox.shrink(),
              content: Form(
                key: controller.formKeys[2],
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // SizedBox(
                      //   width:180,
                      //   child: ElevatedButtonCustom(
                      //     onPressed: controller.openChooseDialog,
                      //     titleText:  "Choose Image",
                      //   ),
                      // ),
                      SizedBox(
                        width: 180,
                        child: OutlinedButton(

                          onPressed: () {
                            controller.openChooseDialog();
                          },
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                              EdgeInsets.all(10), // Remove padding inside the button
                            ),
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            side: MaterialStateProperty.all<BorderSide>(
                              BorderSide(color: ColorManager.primary),
                            ),
                          ),
                          child: Text(
                            "Choose Image",
                            style: TextStyle(
                                color: ColorManager.primary,
                                fontWeight: FontWeight.w600,
                                fontSize:  16,
                                fontFamily: FontConstants.fontPoppinsMedium
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Obx(() => 
                      controller.dusplayImageError.value?
                        CustomText(text: "Please choose image",color: ColorManager.error,fontSize: 12,): Container()
                      ),
                      Obx(() {
                        final galleryFile = controller.galleryFile.value;
                        if (galleryFile != null) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.file(galleryFile,height: 80,width: 80,fit: BoxFit.cover),
                          );
                        } else {
                          return Container();
                        }
                      }),
                      SizedBox(height: 20,),
                      Obx( () => DropdownButtonHideUnderline(

                        child: DropdownButtonFormField(
                          decoration: InputDecoration(
                            fillColor: Colors.grey.shade50,
                          ),
                          hint: Text(
                            'Book Type',
                          ),
                          onChanged: (newValue) {
                            controller.setSelected(newValue!);
                          },
                          value: controller.selected.value,
                          items: ['A+','A-','B+','B-','AB+','AB-','O+','O-'].map((selectedType) {
                            return DropdownMenuItem(

                              child: new Text(
                                selectedType,
                              ),
                              value: selectedType,
                            );
                          }).toList(),
                        ),
                      ),),
                      SizedBox(height: 20,),
                    ],
                  ),
                ),
              ),
              isActive: controller.activeCurrentStep == 2,
              state: controller.stepState(2),
            )
          ],
          physics: AlwaysScrollableScrollPhysics(),
          stepIconBuilder: (int index,stepState){
            return Container(
              height: 50,
              width: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: controller.activeCurrentStep >= index ? ColorManager.primary : ColorManager.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(30)
              ),
              child: controller.activeCurrentStep >= index ? Icon(Icons.check,size: 18,color: ColorManager.white,) : Icon(Icons.edit_outlined,size: 18,color: ColorManager.white,),
            );
          },
          onStepContinue: controller.stepContinue,
          onStepCancel: controller.stepCancel,
          // onStepTapped: controller.stepTapped,
          controlsBuilder: (BuildContext context, ControlsDetails controls) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                children: <Widget>[
                  /* SizedBox(
                                  width:120,
                                  // height: 40,

                                  child: ElevatedButtonCustom(
                                    onPressed:
                                    titleText: controller.activeCurrentStep.value == 2 ? "Finish" : "Next",
                                  ),
                                ),*/
                  SizedBox(
                    width:120,
                    child: CustomRoundedLoadingButton(
                      controller: controller.loginbuttonController,
                      onPressed: (){
                        if(controller.activeCurrentStep.value == 2)
                        {
                          controller.submitForm();

                          // Get.offAllNamed(Routes.OTP,arguments: {'isResetPassword': false,});
                        }else{
                          controller.loginbuttonController.reset();
                          controls.onStepContinue!();
                        }

                      },
                      buttonText: controller.activeCurrentStep.value == 2 ? "Finish" : "Next",
                    ),
                  ),
                  if (controller.activeCurrentStep.value != 0)
                    SizedBox(width: 20,),
                  if (controller.activeCurrentStep.value != 0)
                    SizedBox(
                      width: 120,
                      child: OutlinedButton(

                        onPressed: () {
                          controls.onStepCancel!();
                        },
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                            EdgeInsets.all(10), // Remove padding inside the button
                          ),
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          side: MaterialStateProperty.all<BorderSide>(
                            BorderSide(color: ColorManager.primary),
                          ),
                        ),
                        child: Text(
                          "Previous",
                          style: TextStyle(
                              color: ColorManager.primary,
                              fontWeight: FontWeight.w600,
                              fontSize:  18,
                              fontFamily: FontConstants.fontPoppinsMedium
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            );
          },

        ),
      ),
    );
  }

}
