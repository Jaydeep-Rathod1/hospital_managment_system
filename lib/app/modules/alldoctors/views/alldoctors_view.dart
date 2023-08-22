import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hospital_managment_system/app/resources/color_manager.dart';
import 'package:hospital_managment_system/app/resources/font_manager.dart';
import 'package:hospital_managment_system/app/routes/app_pages.dart';
import 'package:hospital_managment_system/app/widgets/custom_loader.dart';
import 'package:hospital_managment_system/app/widgets/elevated_button_custom.dart';
import 'package:hospital_managment_system/app/widgets/text_custom.dart';

import '../controllers/alldoctors_controller.dart';

class AlldoctorsView extends GetView<AlldoctorsController> {
  const AlldoctorsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Doctors'),
        centerTitle: true,
      ),
        body: Obx(()=>Stack(
          children: [
            ListView.builder(
                padding: const EdgeInsets.all(20),
                itemCount: controller.userList.length,
                itemBuilder: (context,int index){
                  /*return Text("index = ${index}");*/
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


                                        ],
                                      )
                                  )
                                ],
                              ),
                            ),


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
                }
            ),
            if(controller.isLoading.value) CustomLoader()
          ],
        ))
    );
  }
}
