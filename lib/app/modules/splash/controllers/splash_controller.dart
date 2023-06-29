import 'package:get/get.dart';
import 'package:hospital_managment_system/app/routes/app_pages.dart';

class SplashController extends GetxController with GetSingleTickerProviderStateMixin {
  @override
  void onReady() {
    super.onReady();
    // Simulate some initial setup or delay
    print("SPLASH CONTROLLER");
    Future.delayed(Duration(seconds: 1), () {
      print("future deyaled");

      bool isLoggedIn =false;
      if (isLoggedIn == true) {
        Get.offNamed(Routes.ONBOARDING);
      } else {
        // Get.offAll();
        Get.offNamed(Routes.ONBOARDING);
      }
    });
  }
}
