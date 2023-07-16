import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hospital_managment_system/app/resources/font_manager.dart';
import 'package:hospital_managment_system/app/routes/app_pages.dart';
import 'package:hospital_managment_system/app/widgets/elevated_button_custom.dart';
import 'package:hospital_managment_system/app/widgets/text_custom.dart';

import '../controllers/register_complete_controller.dart';

class RegisterCompleteView extends GetView<RegisterCompleteController> {
  const RegisterCompleteView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Container(
          width: Get.mediaQuery.size.width,
          height: Get.mediaQuery.size.height,
          padding: EdgeInsets.all(20),
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/register.png",width: Get.mediaQuery.size.width/1,fit: BoxFit.cover,),
              SizedBox(height: 20,),
              const CustomText(
                text:"Welcome Your registration is complete, providing you with seamless access to essential healthcare services and resources .",
                maxLines: 10,
                textAlign: TextAlign.center,
                fontSize: FontSize.s14,
                fontWeight: FontWeight.normal,
              ),
              SizedBox(height: 20,),
              ElevatedButtonCustom(titleText: "Continue", onPressed: (){
                Get.offAllNamed(Routes.HOME);
              })
            ],
          ),
        ),
      )
    );
  }
}
