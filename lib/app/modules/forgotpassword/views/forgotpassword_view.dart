import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hospital_managment_system/app/resources/extenstion_manager.dart';
import 'package:hospital_managment_system/app/resources/font_manager.dart';
import 'package:hospital_managment_system/app/widgets/elevated_button_custom.dart';
import 'package:hospital_managment_system/app/widgets/text_custom.dart';
import 'package:hospital_managment_system/app/widgets/textformfield_custom.dart';

import '../controllers/forgotpassword_controller.dart';

class ForgotpasswordView extends GetView<ForgotpasswordController> {
  const ForgotpasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            // Positioned(
            //     top: 0,
            //     left: -60,
            //     child: Image.asset("assets/images/stack1.png",height: 200,)),
            // Positioned(
            //     top: 100,
            //     right: 0,
            //     child: Image.asset("assets/images/stack2.png",height: 200,)),
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
                    GestureDetector(
                        onTap: (){}, child: const Icon(Icons.arrow_back_ios_new)),
                    SizedBox(height: 20,),
                    CustomText(
                      text: "Forget your password",
                      maxLines: 2,
                      textStyle: Get.theme.textTheme.displayLarge,
                      letterSpacing: 2,
                      // textStyle:
                    ),
                    SizedBox(height: 40,),
                    CustomText(
                      text: "Email",
                      maxLines: 2,
                      textStyle: Get.theme.textTheme.bodyMedium!.copyWith(
                          fontSize: FontSize.s17
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
                    ElevatedButtonCustom(
                      onPressed:controller.submitForm,
                      titleText: "Get Otp".toUpperCase(),
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
