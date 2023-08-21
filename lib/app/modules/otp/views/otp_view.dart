// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
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
    controller.receivedData.value  = Get.arguments;
    return  Scaffold(
        resizeToAvoidBottomInset:false,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade50,
        elevation: 0,

        title: CustomText(text: 'OTP verification',fontSize: 18,color: ColorManager.primary,),
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
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                // mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 40,),
                    CustomText(text: "Otp has been sent to your Email address",fontSize: FontSize.s14,fontWeight: FontWeight.normal,
                    textAlign: TextAlign.center,
                    ),
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
                        controller.matchedString.value = verificationCode;
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
                                          // print("on tap singup");
                                          // Get.toNamed(Routes.REGISTER);
                                          controller.resendOtp();
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
                  ElevatedButtonCustom(titleText: "Verify",
                      onPressed: (){
                    controller.submitOTP();


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
