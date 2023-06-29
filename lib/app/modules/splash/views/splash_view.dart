import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hospital_managment_system/app/resources/assets_manager.dart';
import 'package:hospital_managment_system/app/resources/color_manager.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   backgroundColor: ColorManager.primary,
    //   body: Center(
    //     child: Image.asset("assets/images/logo.png",height: 300,width: 300,),
    //   )
    // );
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorManager.primary,
          body: Center(
            child:  Image.asset(AssetManager.splashLogo,height: 250,width: 250,),
          ),
        );
      },
    );
  }
}
