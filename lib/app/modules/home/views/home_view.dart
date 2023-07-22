import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospital_managment_system/app/resources/color_manager.dart';
import 'package:hospital_managment_system/app/resources/font_manager.dart';
import 'package:hospital_managment_system/app/widgets/drawer_custom.dart';
import 'package:hospital_managment_system/app/widgets/text_custom.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  final CarouselController _pageController = Get.put(CarouselController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.menu,size: FontSize.s24,),
          onPressed: (){
            controller.toggleDrawer();
          },
        ),
      ),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Obx(
                  () => CarouselSlider(
                items: controller.carouselItems.map((imagePath) {
                  return Builder(
                    builder: (BuildContext context) {
                      return ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          imagePath,
                          fit: BoxFit.fill,

                        ),
                      );
                    },
                  );
                }).toList(),
                    carouselController: controller.pageController,
                options: CarouselOptions(

                  height: 180.0,
                  aspectRatio: 16/9,
                  viewportFraction: 0.8,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: controller.onPageChanged,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                controller.carouselItems.length,
                    (index) => Obx(() {
                  final isActive = controller.currentPage.value == index; // Access current page index
                  return Container(
                    width: isActive?10.0:7.0,
                    height:isActive?10.0: 7.0,
                    margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isActive ? ColorManager.primary : Colors.grey.withOpacity(0.5),
                    ),
                  );
                }),
              ),
            ),
            SizedBox(height: 20,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 5),
              child:Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(text: "Consult by Speciality",fontSize: FontSize.s16,),
                  CustomText(text: "View all",fontSize: FontSize.s12,color: ColorManager.primary,),
                ],
              )
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 3/4,
                    crossAxisSpacing: 15, mainAxisSpacing: 0
                ),

                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.items.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 80,
                          width: 80,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: ColorManager.lightPrimary,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Image.asset("assets/icons/endocrine.png",height: 50,width: 50,color: ColorManager.primary,)),
                      SizedBox(height: 10,),
                      CustomText(text: controller.items[index],fontWeight: FontWeight.w500,color: ColorManager.primary,)
                    ],
                  );
                },
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 5),
                child:Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(text: "Popular Doctor",fontSize: FontSize.s16,),
                    CustomText(text: "View all",fontSize: FontSize.s12,color: ColorManager.primary,),
                  ],
                )
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 3/4,
                    crossAxisSpacing: 15, mainAxisSpacing: 0
                ),

                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.items.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          height: 80,
                          width: 80,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: ColorManager.lightPrimary,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Image.asset("assets/icons/docto2.png",height: 50,width: 50,color: ColorManager.primary,)),
                      SizedBox(height: 10,),
                      CustomText(text: controller.items[index],fontWeight: FontWeight.w500,color: ColorManager.primary,)
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      )
    );
  }
}
