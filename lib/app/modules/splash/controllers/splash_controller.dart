import 'package:get/get.dart';
import 'package:hospital_managment_system/app/resources/storage_manager.dart';
import 'package:hospital_managment_system/app/routes/app_pages.dart';

class SplashController extends GetxController with GetSingleTickerProviderStateMixin {
  final isLogin = false.obs;
  final isOnboarding = false.obs;
  final StorageManager _storage = StorageManager();

  @override
  void onReady() {
    super.onReady();
    // Simulate some initial setup or delay
    print("SPLASH CONTROLLER");
    Future.delayed(const Duration(seconds: 3), () async{
      isLogin.value =await _storage.getValue('isLogin') ?? false;
      isOnboarding.value =await _storage.getValue('isOnboarding') ?? false;
      if(isOnboarding.value)
        {
          if (isLogin.value) {
            Get.offNamed(Routes.HOME);
          } else {
            Get.offNamed(Routes.LOGIN);
          }

        }else {
        Get.offNamed(Routes.ONBOARDING);
      }
    });
  }
}
