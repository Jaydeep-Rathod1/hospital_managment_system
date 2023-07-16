// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import 'package:get/get.dart';
import 'package:hospital_managment_system/app/resources/color_manager.dart';
import 'package:hospital_managment_system/app/resources/font_manager.dart';
import 'package:hospital_managment_system/app/routes/app_pages.dart';
import 'package:hospital_managment_system/app/widgets/elevated_button_custom.dart';
import 'package:hospital_managment_system/app/widgets/text_custom.dart';

import '../controllers/otp_controller.dart';

class OtpView extends GetView<OtpController> {
  const OtpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var arguments = Get.arguments;
    var isResetPassword = arguments['isResetPassword'];
    return  Scaffold(
      resizeToAvoidBottomInset: true,
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
              padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                    GestureDetector(
                        onTap: (){}, child: const Icon(Icons.arrow_back_ios_new)),
                    SizedBox(height: 30,),
                    CustomText(text: "OTP verification",fontSize: FontSize.s24),
                    SizedBox(height: 8,),
                    CustomText(text: "Otp has been sent to your Email address",fontSize: FontSize.s14,fontWeight: FontWeight.normal,),
                    SizedBox(height: 20,),
                    OtpTextField(
                      mainAxisAlignment: MainAxisAlignment.center,
                      margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),

                      numberOfFields: 4,
                      borderColor: ColorManager.grey,
                      // enabledBorderColor: ColorManager.primary,
                      // disabledBorderColor: ColorManager.grey,
                      focusedBorderColor: ColorManager.primary,
                      cursorColor: ColorManager.primary,
                      //set to true to show as box or false to show as dash
                      showFieldAsBox: true,
                      //runs when a code is typed in
                      onCodeChanged: (String code) {
                        //handle validation or checks here
                      },
                      //runs when every textfield is filled
                      onSubmit: (String verificationCode){
                        print("success");
                      }, // end onSubmit
                    ),
                    SizedBox(height: 20,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: (){},
                          child: RichText(
                            text: TextSpan(
                                text: 'Didn’t recieve the OTP ',
                                style: TextStyle(
                                    color: Colors.black, fontSize: FontSize.s14,fontFamily:FontConstants.fontPoppinsRegular ),
                                children: <TextSpan>[
                                  TextSpan(text: 'Resend it',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold, fontSize: FontSize.s16),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          print("on tap singup");
                                          Get.toNamed(Routes.REGISTER);
                                        }
                                  )
                                ]
                            ),
                          ),
                        ),
                        CustomText(text: "00:00",fontSize: FontSize.s14,color: ColorManager.primary,),
                      ],
                    ),
                  SizedBox(height: 40,),
                  ElevatedButtonCustom(titleText: "Verify", onPressed: (){
                    if(isResetPassword)
                      {
                        Get.offNamed(Routes.RESETPASSWORD);
                      }else{
                      Get.offNamed(Routes.REGISTER_COMPLETE);
                    }

                  })
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}
