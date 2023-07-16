import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hospital_managment_system/app/resources/font_manager.dart';
import 'package:hospital_managment_system/app/routes/app_pages.dart';
import 'package:hospital_managment_system/app/widgets/elevated_button_custom.dart';
import 'package:hospital_managment_system/app/widgets/text_custom.dart';

import '../controllers/password_change_suceess_controller.dart';

class PasswordChangeSuceessView
    extends GetView<PasswordChangeSuceessController> {
  const PasswordChangeSuceessView({Key? key}) : super(key: key);
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
                Image.asset("assets/images/passwordsucess.png",width: Get.mediaQuery.size.width/1,fit: BoxFit.cover,),
                SizedBox(height: 30,),
                const CustomText(
                  text:"Your password has been changed successful.",
                  maxLines: 10,
                  textAlign: TextAlign.center,
                  fontSize: FontSize.s16,
                  fontWeight: FontWeight.normal,
                ),
                SizedBox(height: 60,),
                ElevatedButtonCustom(titleText: "Continue", onPressed: (){
                  Get.offAllNamed(Routes.LOGIN);
                })
              ],
            ),
          ),
        )
    );
  }
}
