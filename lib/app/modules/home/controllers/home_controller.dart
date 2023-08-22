import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospital_managment_system/app/data/model/deparment_model.dart';
import 'package:hospital_managment_system/app/data/model/user_model.dart';
import 'package:hospital_managment_system/app/data/repositories/user_repository.dart';
import 'package:hospital_managment_system/app/resources/color_manager.dart';
import 'package:hospital_managment_system/app/resources/url_manager.dart';

class HomeController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  RxList<DepartmentModel> departmentList = <DepartmentModel>[].obs;
  RxList<UserModel> userList = <UserModel>[].obs;
  Rx<bool> isLoading = false.obs;
  final UserRepository _userRepository = UserRepository();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getDashboardData();
  }
  getDashboardData()async{
    try{
      isLoading.value = true;

      var url = UrlManager.DASHBORAD;
      var response = await _userRepository.getDashborad(url);
      if(response['status'] == "true"){
        List<dynamic> deparmentdata = response['deparmentdata'];
        departmentList.value =deparmentdata.map((e) =>DepartmentModel.fromJson(e)).toList();
        List<dynamic> userdata = response['doctordata'];
        userList.value =userdata.map((e) =>UserModel.fromJson(e)).toList();
        update();
        isLoading.value = false;
      }else{
        isLoading.value = false;
        Get.snackbar(
          'Error',
          "",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: ColorManager.error,
          colorText: ColorManager.white,
          margin: EdgeInsets.all(20),
          duration: Duration(seconds: 3),
        );
      }

    }catch(e){
      isLoading.value = false;
      Get.snackbar(
        'Error',
        "",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: ColorManager.error,
        colorText: ColorManager.white,
        margin: EdgeInsets.all(20),
        duration: Duration(seconds: 3),
      );
    }
  }

  void toggleDrawer() {
    if (scaffoldKey.currentState!.isDrawerOpen) {
      scaffoldKey.currentState!.openEndDrawer();
    } else {
      scaffoldKey.currentState!.openDrawer();
    }
  }

  var carouselItems = [
    'assets/banner/1.jpg',
    'assets/banner/2.jpg',
    'assets/banner/3.jpg',
    'assets/banner/4.jpg',
    'assets/banner/5.jpg',
    'assets/banner/6.jpg',
    'assets/banner/7.jpg',
    'assets/banner/8.jpg',
    'assets/banner/9.jpg',
    'assets/banner/10.jpg',
    'assets/banner/11.jpg',
    'assets/banner/12.jpg',
    'assets/banner/13.jpg'
  ].obs;
  final CarouselController _pageController = CarouselController();
  final RxInt currentPage = 0.obs; // Add current page index

  CarouselController get pageController => _pageController;

  void onPageChanged(int index, CarouselPageChangedReason reason) {
    currentPage.value = index; // Update current page index
  }


}
