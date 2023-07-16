import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

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

  List<String> items = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5','Item 6'];
}
