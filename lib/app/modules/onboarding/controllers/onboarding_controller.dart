import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospital_managment_system/app/data/model/onboarding_model.dart';
import 'package:hospital_managment_system/app/resources/assets_manager.dart';
import 'package:hospital_managment_system/app/routes/app_pages.dart';

import '../../../resources/storage_manager.dart';

class OnboardingController extends GetxController {
  var selectedPageIndex = 0.obs;
  var pageController = PageController();
  bool get isFirstPage => selectedPageIndex.value == 0;
  bool get isLastPage => selectedPageIndex.value == onboardingPages.length - 1;
  final StorageManager _storage = StorageManager();
  nextAction()async {
    if (isLastPage) {
      await _storage.setValue('isOnboarding',true);
      Get.offNamed(Routes.LOGIN);
    } else {
      pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
    }
  }
  onSkip()async{
    await _storage.setValue('isOnboarding',true);
    Get.offNamed(Routes.LOGIN);
  }

  skipAction() {
    pageController.previousPage(
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  List<OnboardingInfo> onboardingPages = [
    OnboardingInfo(AssetManager.onboardingLogo1, 'Find doctor near you',
        'Find doctor and make an appointment with them as you want and make an appointment with them as you want.'),
    OnboardingInfo(AssetManager.onboardingLogo2, 'Healthcare with consulation',
        'Clinical excellent must be the priority for any health care service provider and enter yout detail info account.'),
    OnboardingInfo(AssetManager.onboardingLogo3, 'Medicine delivery order',
        'Too busy to buy medicine? or order and get free delivery order and make an appoinment with them as you want.'),
    OnboardingInfo(AssetManager.onboardingLogo4, 'Family health and welness',
        'Enter your details info account and it will help you to find right doctor for you to busy to buy medicine.'),
  ];
}
