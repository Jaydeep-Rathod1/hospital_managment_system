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

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset:false,
        body:SafeArea(
        child: Stack(
          children: [
            Positioned(

              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key:controller.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 10,),
                      CustomText(
                          text: "Login into your \nAccount",
                          maxLines: 2,
                          textStyle: Get.theme.textTheme.displayLarge,
                          letterSpacing: 2,
                          // textStyle:
                      ),
                      SizedBox(height: 30,),
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
                      SizedBox(height: 10,),
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
                      SizedBox(height: 30,),

                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: (){
                            Get.offNamed(Routes.FORGOTPASSWORD);
                          },
                          child: CustomText(
                            text: "Forget Password ?",
                            textStyle: Get.theme.textTheme.bodyMedium!.copyWith(
                                fontSize: FontSize.s15,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.6
                            ),
                            letterSpacing: 2,
                            // textStyle:
                          ),
                        ),
                      ),
                      SizedBox(height: 15,),
                      ElevatedButtonCustom(
                        onPressed:controller.submitForm,
                        titleText: "LOGIN",
                      ),
                      SizedBox(height: 20,),
                      Align(
                        alignment: Alignment.center,
                        child: InkWell(
                          onTap: (){},
                          child: RichText(
                            text: TextSpan(
                                text: 'Don\'t have an account?',
                                style: TextStyle(
                                    color: Colors.black, fontSize: FontSize.s16),
                                children: <TextSpan>[
                                  TextSpan(text: ' Sign up',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold, fontSize: FontSize.s18),
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
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
                alignment: Alignment.bottomRight,
                child: Image.asset("assets/images/backimg.png",height: Get.mediaQuery.size.height/3,))
          ],
        ),
      )
    );
  }
}
