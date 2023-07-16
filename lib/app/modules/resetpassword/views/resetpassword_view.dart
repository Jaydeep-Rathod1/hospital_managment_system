import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hospital_managment_system/app/resources/color_manager.dart';
import 'package:hospital_managment_system/app/resources/extenstion_manager.dart';
import 'package:hospital_managment_system/app/resources/font_manager.dart';
import 'package:hospital_managment_system/app/routes/app_pages.dart';
import 'package:hospital_managment_system/app/widgets/elevated_button_custom.dart';
import 'package:hospital_managment_system/app/widgets/text_custom.dart';
import 'package:hospital_managment_system/app/widgets/textformfield_custom.dart';

import '../controllers/resetpassword_controller.dart';

class ResetpasswordView extends GetView<ResetpasswordController> {
  const ResetpasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset:false,
        body:SafeArea(
          child: Stack(
            children: [

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key:controller.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 10,),
                      CustomText(
                        text: "Reset password",
                        maxLines: 2,
                        textStyle: Get.theme.textTheme.displayLarge,
                        letterSpacing: 2,
                        // textStyle:
                      ),
                      SizedBox(height: 30,),
                      CustomText(
                        text: "Password",
                        maxLines: 2,
                        textStyle: Get.theme.textTheme.bodyMedium!.copyWith(
                            fontSize: FontSize.s17
                        ),
                        letterSpacing: 2,
                        // textStyle:
                      ),
                      Obx(() => TextFormFieldCustom(
                        textController: controller.passwordController,
                        keyboardType: TextInputType.text,
                        obscureText: !controller.isPasswordVisible.value,
                        hintText: "Enter Password",
                        validator: (value) => value!.validatePassword(),
                        suffixIcon: IconButton(onPressed: (){
                          controller.togglePasswordVisibility();
                        }, icon: Icon(controller.isPasswordVisible.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                          color: ColorManager.grey,)),
                      ),),
                      SizedBox(height: 10,),
                      CustomText(
                        text: "Confirm Password",
                        maxLines: 2,
                        textStyle: Get.theme.textTheme.bodyMedium!.copyWith(
                            fontSize: FontSize.s17
                        ),
                        letterSpacing: 2,
                        // textStyle:
                      ),
                      Obx(() => TextFormFieldCustom(
                        textController: controller.confirmpasswordController,
                        keyboardType: TextInputType.text,
                        obscureText: !controller.isCPasswordVisible.value,
                        hintText: "Enter Confirm Password",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm your password';
                          } else if (value != controller.passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                        suffixIcon: IconButton(onPressed: (){
                          controller.toggleCPasswordVisibility();
                        }, icon: Icon(controller.isCPasswordVisible.value
                            ? Icons.visibility
                            : Icons.visibility_off,
                          color: ColorManager.grey,)),
                      ),),
                      SizedBox(height: 30,),


                      ElevatedButtonCustom(
                        onPressed:controller.submitForm,
                        titleText: "CONFIRM",
                      ),


                    ],
                  ),
                ),
              ),


              Align(
                  alignment: Alignment.bottomRight,
                  child: Image.asset("assets/images/backimg.png",height: Get.mediaQuery.size.height/3,)),

            ],
          ),
        )
    );
  }
}
