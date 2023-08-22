import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospital_managment_system/app/resources/color_manager.dart';
import 'package:hospital_managment_system/app/resources/font_manager.dart';
import 'package:hospital_managment_system/app/routes/app_pages.dart';
import 'package:hospital_managment_system/app/widgets/custom_loader.dart';
import 'package:hospital_managment_system/app/widgets/drawer_custom.dart';
import 'package:hospital_managment_system/app/widgets/elevated_button_custom.dart';
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
      body: Obx(() => SingleChildScrollView(
        child: Stack(
          children: [
            Column(
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
                        InkWell(
                            onTap: (){
                              Get.toNamed(Routes.DEPARTMENTS);
                            },
                            child: CustomText(text: "View all",fontSize: FontSize.s12,color: ColorManager.primary,)),
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
                    itemCount: controller.departmentList.value.length,
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
                          CustomText(text: controller.departmentList[index].name!,fontWeight: FontWeight.w500,color: ColorManager.primary,)
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
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: controller.userList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: (){
                          Get.toNamed(Routes.DOCTORDETAILS,arguments: {"userData" : controller.userList[index]});
                        },
                        child: Card(
                            margin: EdgeInsets.only(bottom: 15),
                            elevation: 0.2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 15.0,left: 10,right: 10,bottom: 15),
                              child: Column(children: [
                                SizedBox(
                                  height: 100,
                                  width: Get.mediaQuery.size.width,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 90,
                                        width: 90,
                                        child: CachedNetworkImage(
                                          imageUrl: 'https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80', // Replace with your image URL
                                          imageBuilder: (context, imageProvider) => Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          placeholder: (context, url) => Container(
                                            height: 50,
                                            width: 50,
                                            padding: EdgeInsets.all(25),
                                            child: CircularProgressIndicator(color: ColorManager.primary,),
                                          ),
                                          errorWidget: (context, url, error) => Icon(Icons.error),
                                        ),
                                      ),
                                      SizedBox(width: 20,),
                                      Expanded(
                                          flex: 1,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              CustomText(text: 'Dr. ${controller.userList[index].firstname} ${controller.userList[index].lastname}',fontSize: 16,maxLines: 1,textOverflow: TextOverflow.ellipsis),
                                              SizedBox(height: 5,),
                                              CustomText(text: '${controller.userList[index].education}',fontSize: 12,maxLines: 1,textOverflow: TextOverflow.ellipsis,color: ColorManager.darkGrey,fontWeight: FontWeight.normal,),
                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  CustomText(text: 'Experience',fontSize: 12,maxLines: 1,textOverflow: TextOverflow.ellipsis,fontWeight: FontWeight.w500,color: ColorManager.black,),
                                                  CustomText(text: '${controller.userList[index].experience ?? 0} years',fontSize: 12,maxLines: 2,textOverflow: TextOverflow.ellipsis,fontWeight: FontWeight.w500),
                                                ],
                                              ),
                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  CustomText(text: 'Consulation Fees',fontSize: 12,maxLines: 1,textOverflow: TextOverflow.ellipsis,fontWeight: FontWeight.bold,color: ColorManager.black,),
                                                  CustomText(text: '₹ ${controller.userList[index].charge ?? 0}',fontSize: 12,maxLines: 1,textOverflow: TextOverflow.ellipsis,fontWeight: FontWeight.bold),
                                                ],
                                              ),
                                              SizedBox(height: 7,),
                                              Expanded(child: Align(
                                                alignment: Alignment.bottomRight,
                                                child: InkWell(
                                                  onTap: (){},
                                                  child: CustomText(text: "View More",color: ColorManager.primary,fontSize: FontSize.s14,),
                                                ),
                                              ))
                                            ],
                                          )
                                      )
                                    ],
                                  ),
                                ),

                                SizedBox(height: 8,),
                                Divider(),
                                SizedBox(height: 5,),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap:(){},
                                          child: Container(
                                            // margin: EdgeInsets.all(10),
                                            alignment: Alignment.center,
                                            height: 35,
                                            width: 35,
                                            decoration: BoxDecoration(
                                                color: ColorManager.primary.withOpacity(0.3),
                                                borderRadius: BorderRadius.circular(10)
                                            ),
                                            child: Icon(Icons.phone_outlined,color: ColorManager.primary,size: 20,),
                                          ),
                                        ),
                                        SizedBox(width: 15,),
                                        InkWell(
                                          onTap:(){},
                                          child: Container(
                                            // margin: EdgeInsets.all(10),
                                            alignment: Alignment.center,
                                            height: 35,
                                            width: 35,
                                            decoration: BoxDecoration(
                                                color: ColorManager.primary.withOpacity(0.3),
                                                borderRadius: BorderRadius.circular(10)
                                            ),
                                            child: Icon(Icons.message_outlined,color: ColorManager.primary,size: 20,),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          height: 35,
                                          width: 110,

                                          child: ElevatedButtonCustom(
                                              titleText: "Book Now",
                                              fontSize: 14,
                                              padding: EdgeInsets.zero,
                                              onPressed: (){
                                                // Get.offAllNamed(Routes.LOGIN);
                                              }),
                                        )
                                      ],
                                    )

                                  ],
                                )

                              ],),
                            )
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            if(controller.isLoading.value) CustomLoader()
          ],
        )
      ))
    );
  }
}
