import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hospital_managment_system/app/resources/color_manager.dart';
import 'package:hospital_managment_system/app/resources/font_manager.dart';
import 'package:hospital_managment_system/app/resources/storage_manager.dart';
import 'package:hospital_managment_system/app/routes/app_pages.dart';
import 'package:hospital_managment_system/app/widgets/text_custom.dart';

class CustomDrawer extends StatelessWidget {
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
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                border: Border.all(color: ColorManager.grey),
                                borderRadius: BorderRadius.circular(60),
                                color: ColorManager.primary
                            ),
                            child: Image.asset('assets/images/logo.png',fit: BoxFit.cover,),
                          )
                        ],
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(child: CustomText(text:"Rathod Jaydeep Rathod Jaydeep",maxLines: 1,fontSize: FontSize.s18,textOverflow: TextOverflow.ellipsis)),

                            CustomText(text:"7285052823",maxLines: 2,fontSize: FontSize.s12,),
                            SizedBox(height: 8,),
                            InkWell(
                                onTap: (){
                                  Get.toNamed(Routes.EDITPROFILEVIEW);
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
                    Get.toNamed(Routes.APPOINTMENT);
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
                    child: CustomText(text: "Notification",fontSize: FontSize.s16,fontWeight: FontWeight.w500,color: ColorManager.primary,),
                  ),
                  onTap: () {
                    Get.toNamed(Routes.NOTIFICATION);
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
                ),
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