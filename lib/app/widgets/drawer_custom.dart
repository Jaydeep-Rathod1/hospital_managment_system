import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospital_managment_system/app/resources/color_manager.dart';
import 'package:hospital_managment_system/app/resources/font_manager.dart';
import 'package:hospital_managment_system/app/resources/storage_manager.dart';
import 'package:hospital_managment_system/app/resources/url_manager.dart';
import 'package:hospital_managment_system/app/routes/app_pages.dart';
import 'package:hospital_managment_system/app/widgets/drawer_custom_controller.dart';
import 'package:hospital_managment_system/app/widgets/text_custom.dart';

class CustomDrawer extends StatelessWidget {
  final CustomDrawerController controller = Get.put(CustomDrawerController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child:Column(
          children: [
            SizedBox(
              height: 140,
              child: DrawerHeader(
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 80,
                            width: 80,
                            // padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                border: Border.all(color: ColorManager.grey),
                                borderRadius: BorderRadius.circular(60),
                                color: ColorManager.primary
                            ),
                            child: CachedNetworkImage(
                              fit: BoxFit.fill,

                              // imageUrl: 'https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80',
                              imageUrl: UrlManager.PATIENTPHOTO_URL+controller.userModel.profilePicture!, // Replace with your image URL// Replace with your image URL
                              imageBuilder: (context, imageProvider) => Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(60),
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
                              errorWidget: (context, url, error) =>  Container(
                                height: 80,
                                width: 80,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border: Border.all(color: ColorManager.grey),
                                    borderRadius: BorderRadius.circular(60),
                                    color: ColorManager.primary
                                ),
                                child: Image.asset('assets/images/logo.png',fit: BoxFit.cover,),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(child: CustomText(text:"${controller.userModel.firstname} ${controller.userModel.lastname}" ?? "",maxLines: 1,fontSize: FontSize.s18,textOverflow: TextOverflow.ellipsis)),

                            CustomText(text: controller.userModel.mobileNo ?? "",maxLines: 2,fontSize: FontSize.s12,),
                            SizedBox(height: 8,),
                            InkWell(
                                onTap: (){
                                  var datatosend ={
                                    "userdata":controller.userModel
                                  };
                                  Get.toNamed(Routes.EDITPROFILEVIEW,arguments: datatosend);
                                },
                                child: CustomText(text:"View / Edit Profile",maxLines: 2,fontSize: FontSize.s12,color: ColorManager.primary,)),
                          ],
                        ),
                      ),
                    ],
                  )
              ),
            ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [

                ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Image.asset("assets/icons/home1.png",height: 25,width: 25,color: ColorManager.primary,),
                  ),
                  title: Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: CustomText(text: "Home",fontSize: FontSize.s16,fontWeight: FontWeight.w500,color: ColorManager.primary,),
                  ),
                  onTap: () {
                    Get.back(); // Close the drawer
                    // Perform desired actions for Home
                  },
                ),
                Divider(
                  height: 5,
                  indent: 0,
                  thickness: 1,
                ),
                ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Image.asset("assets/icons/deparment.png",height: 25,width: 25,scale: 10,color: ColorManager.primary,),
                  ),
                  title: Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: CustomText(text: "Departments",fontSize: FontSize.s16,fontWeight: FontWeight.w500,color: ColorManager.primary,),
                  ),
                  onTap: () {
                    Get.toNamed(Routes.DEPARTMENTS);
                    // Perform desired actions for Home
                  },
                ),
                Divider(
                  height: 5,
                  indent: 0,
                  thickness: 1,
                ),
                ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Image.asset("assets/icons/docto2.png",height: 27,width: 27,color: ColorManager.primary,),
                  ),
                  title: Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: CustomText(text: "Doctors",fontSize: FontSize.s16,fontWeight: FontWeight.w500,color: ColorManager.primary,),
                  ),
                  onTap: () {
                    Get.toNamed(Routes.ALLDOCTORS);
                    // Perform desired actions for Home
                  },
                ),
                Divider(
                  height: 5,
                  indent: 0,
                  thickness: 1,
                ),
                ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Image.asset("assets/icons/appointment.png",height: 25,width: 25,color: ColorManager.primary,),
                  ),
                  title: Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: CustomText(text: "Appointments",fontSize: FontSize.s16,fontWeight: FontWeight.w500,color: ColorManager.primary,),
                  ),
                  onTap: () {
                    Get.toNamed(Routes.MYAPPOINTMENT);
                    // Perform desired actions for Home
                  },
                ),

                Divider(
                  height: 5,
                  indent: 0,
                  thickness: 1,
                ),
                /*ListTile(

                  leading: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Image.asset("assets/icons/call.png",height: 23,width: 25,color: ColorManager.primary,),
                  ),
                  title: Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: CustomText(text: "Call Request",fontSize: FontSize.s16,fontWeight: FontWeight.w500,color: ColorManager.primary,),
                  ),
                  onTap: () {
                    Get.toNamed(Routes.Ca);
                    // Perform desired actions for Home
                  },
                ),
                Divider(
                  height: 5,
                  indent: 0,
                  thickness: 1,
                ),*/
                ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Image.asset("assets/icons/alarambell4.png",height: 28,width: 28,color: ColorManager.primary,),
                  ),
                  title: Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: CustomText(text: "Chats",fontSize: FontSize.s16,fontWeight: FontWeight.w500,color: ColorManager.primary,),
                  ),
                  onTap: () {
                    Get.toNamed(Routes.CHATLIST);
                    // Perform desired actions for Home
                  },
                ),
                Divider(
                  height: 5,
                  indent: 0,
                  thickness: 1,
                ),
                ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Image.asset("assets/icons/feedback.png",height: 25,width: 25,color: ColorManager.primary,),
                  ),
                  title: Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: CustomText(text: "Send Feedback",fontSize: FontSize.s16,fontWeight: FontWeight.w500,color: ColorManager.primary,),
                  ),
                  onTap: () {
                    Get.toNamed(Routes.FEEDBACK);
                    // Perform desired actions for Home
                  },
                ),
               /* Divider(
                  height: 5,
                  indent: 0,
                  thickness: 1,
                ),
                ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Image.asset("assets/icons/support.png",height: 25,width: 25,color: ColorManager.primary,),
                  ),
                  title: Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: CustomText(text: "Supoort",fontSize: FontSize.s16,fontWeight: FontWeight.w500,color: ColorManager.primary,),
                  ),
                  onTap: () {
                    Get.back(); // Close the drawer
                    // Perform desired actions for Home
                  },
                ),*/
                Divider(
                  height: 5,
                  indent: 0,
                  thickness: 1,
                ),
                ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Image.asset("assets/icons/logout3.png",height: 28,width: 28,color: ColorManager.primary,),
                  ),
                  title: Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: CustomText(text: "Log Out",fontSize: FontSize.s16,fontWeight: FontWeight.w500,color: ColorManager.primary,),
                  ),
                  onTap: () {
                    final StorageManager _storage = StorageManager();
                    _storage.removeAll();
                    Get.offNamed('/login'); // Close the drawer
                    // Perform desired actions for Home
                  },
                ),
                Divider(
                  height: 5,
                  indent: 0,
                  thickness: 1,
                ),
              ],
            ),
          ),

        ],)
      ),
    );
  }
}