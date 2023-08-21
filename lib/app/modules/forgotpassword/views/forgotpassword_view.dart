import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hospital_managment_system/app/resources/color_manager.dart';
import 'package:hospital_managment_system/app/resources/extenstion_manager.dart';
import 'package:hospital_managment_system/app/resources/font_manager.dart';
import 'package:hospital_managment_system/app/widgets/elevated_button_custom.dart';
import 'package:hospital_managment_system/app/widgets/rounded_loading_button.dart';
import 'package:hospital_managment_system/app/widgets/text_custom.dart';
import 'package:hospital_managment_system/app/widgets/textformfield_custom.dart';

import '../controllers/forgotpassword_controller.dart';

class ForgotpasswordView extends GetView<ForgotpasswordController> {
  const ForgotpasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade50,
          elevation: 0,

          title: CustomText(text: 'Forgot Password',fontSize: 18,color: ColorManager.primary,),
          iconTheme: IconThemeData(
            color: ColorManager.primary, //change your color here
          ),
        ),
      body: SafeArea(
        child: Stack(
          children: [

            Align(
                alignment: Alignment.bottomRight,
                child: Image.asset("assets/images/backimg.png",height: Get.mediaQuery.size.height/3,)),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key:controller.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
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
                      hintText: "Enter Email",
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) => value!.validateEmail(),
                    ),
                    SizedBox(height: 40,),
                    // ElevatedButtonCustom(
                    //   onPressed:controller.submitForm,
                    //   titleText: "Get Otp".toUpperCase(),
                    // ),
                    CustomRoundedLoadingButton(
                      controller: controller.loginbuttonController,
                      onPressed:controller.submitForm,
                      buttonText: "Get Otp".toUpperCase(),
                    ),
                    SizedBox(height: 20,),

                  ],
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
