import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospital_managment_system/app/resources/color_manager.dart';
import 'package:hospital_managment_system/app/resources/extenstion_manager.dart';
import 'package:hospital_managment_system/app/resources/font_manager.dart';
import 'package:hospital_managment_system/app/resources/url_manager.dart';
import 'package:hospital_managment_system/app/widgets/rounded_loading_button.dart';
import 'package:hospital_managment_system/app/widgets/text_custom.dart';
import 'package:hospital_managment_system/app/widgets/textformfield_custom.dart';
import '../controllers/editprofileview_controller.dart';

class EditprofileviewView extends GetView<EditprofileviewController> {
  const EditprofileviewView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text('Edit Profile'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                // mainAxisSize: MainAxisSize.min,
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

                    enabled: false,
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
                    enabled: false,
                    validator: (value) => value!.validateEmail(),
                  ),
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
                 Obx(() =>  Row(
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
                 ),),
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
                  SizedBox(height: 10,),
                  CustomText(
                    text: "Profile Picture",
                    maxLines: 2,
                    textStyle: Get.theme.textTheme.bodyMedium!.copyWith(
                        fontSize: FontSize.s14,
                        fontWeight: FontWeight.w500
                    ),
                    letterSpacing: 2,
                    // textStyle:
                  ),
                  SizedBox(height: 10,),
                  SizedBox(
                    width: 150,
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
                  Obx(() {
                    if(!controller.isSelectImage.value){
                      return Container(
                        height: 80,
                        width: 80,
                        child: CachedNetworkImage(
                          // imageUrl: 'https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80',
                          imageUrl: UrlManager.PATIENTPHOTO_URL+controller.imageOninit.value, // Replace with your image URL// Replace with your image URL
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          placeholder: (context, url) => Container(
                            height: 50,
                            width: 50,
                            padding: EdgeInsets.all(25),
                            child: CircularProgressIndicator(color: ColorManager.primary,),
                          ),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        ),
                      );
                    }else{
                      final galleryFile = controller.galleryFile.value;
                      if (galleryFile != null) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.file(galleryFile,height: 80,width: 80,fit: BoxFit.cover),
                        );
                      } else {
                        return Container();
                      }
                    }

                  }),
                  SizedBox(height: 10,),
                  CustomText(
                    text: "Blood Group",
                    maxLines: 2,
                    textStyle: Get.theme.textTheme.bodyMedium!.copyWith(
                        fontSize: FontSize.s14,
                        fontWeight: FontWeight.w500
                    ),
                    letterSpacing: 2,
                    // textStyle:
                  ),
                  SizedBox(height: 10,),
                  Obx( () => DropdownButtonHideUnderline(
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        fillColor: Colors.grey.shade50,
                      ),
                      hint: Text(
                        'Blood Group',
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
                  SizedBox(height: 40,),
                  CustomRoundedLoadingButton(
                    controller: controller.loginbuttonController,
                    onPressed: (){
                      controller.submitForm();
                    },
                    buttonText:"UPDATE",
                  ),

                ],
              ),
            )
          ),
        )
    );
  }
}
