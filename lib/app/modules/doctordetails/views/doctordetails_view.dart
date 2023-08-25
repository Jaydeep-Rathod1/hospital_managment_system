import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hospital_managment_system/app/resources/color_manager.dart';
import 'package:hospital_managment_system/app/resources/font_manager.dart';
import 'package:hospital_managment_system/app/resources/url_manager.dart';
import 'package:hospital_managment_system/app/widgets/custom_loader.dart';
import 'package:hospital_managment_system/app/widgets/text_custom.dart';

import '../controllers/doctordetails_controller.dart';

class DoctordetailsView extends GetView<DoctordetailsController> {
  const DoctordetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Obx(()=> Text(controller.departmentNameTitle.toString())),
        centerTitle: true,
      ),
      body: Obx(()=>Stack(

          children: [
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(120),
                        child: CachedNetworkImage(
                          height: 150,
                          width: 150,
                          // imageUrl: 'https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80',
                          imageUrl: UrlManager.DOCTORPHOTO_URL+controller.usermodel!.profilePicture!, // Replace with your image URL// Replace with your image URL
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
                    ),
                    SizedBox(height: 10,),
                    Container(
                      alignment: Alignment.center,
                      child: CustomText(
                        text: "Dr. ${controller.usermodel!.firstname} ${controller.usermodel!.lastname}" ?? "",
                        fontSize: FontSize.s18,
                        maxLines: 10,
                        textAlign: TextAlign.center,
                      )
                    ),
                    SizedBox(height: 10,),
                    Table(
                      border: TableBorder.all(color: ColorManager.grey.withOpacity(0.2)), // Add border to the table
                      defaultColumnWidth: FlexColumnWidth(),
                      children: [
                        TableRow(
                          children: [
                            const TableCell(
                              child: Padding(
                                padding: EdgeInsets.all(8),
                                child: CustomText(
                                  text: "Education",
                                  fontSize: FontSize.s15,
                                  maxLines: 10,
                                ),
                              )// Data cell content
                            ),
                            TableCell(
                                child: Padding(
                                  padding:const EdgeInsets.all(8),
                                  child: CustomText(
                                    text: "${controller.usermodel!.education}" ?? "",
                                    fontSize: FontSize.s15,
                                    maxLines: 10,
                                    fontWeight: FontWeight.normal,
                                  ),
                                )// Data cell content
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            const TableCell(
                                child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: CustomText(
                                    text: "Department",
                                    fontSize: FontSize.s15,
                                    maxLines: 10,
                                  ),
                                )// Data cell content
                            ),
                            TableCell(
                                child: Padding(
                                  padding:const EdgeInsets.all(8),
                                  child: CustomText(
                                    text: controller.usermodel!.departmentName ?? "",
                                    fontSize: FontSize.s15,
                                    maxLines: 10,
                                    fontWeight: FontWeight.normal,

                                  ),
                                )// Data cell content
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            const TableCell(
                                child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: CustomText(
                                    text: "Experience",
                                    fontSize: FontSize.s15,
                                    maxLines: 10,
                                  ),
                                )// Data cell content
                            ),
                            TableCell(
                                child: Padding(
                                  padding:const EdgeInsets.all(8),
                                  child: CustomText(
                                    text: "${controller.usermodel!.experience} years" ?? "",
                                    fontSize: FontSize.s15,
                                    maxLines: 10,
                                    fontWeight: FontWeight.normal,

                                  ),
                                )// Data cell content
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            const TableCell(
                                child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: CustomText(
                                    text: "Description",
                                    fontSize: FontSize.s15,
                                    maxLines: 10,
                                  ),
                                )// Data cell content
                            ),
                            TableCell(
                                child: Padding(
                                  padding:const EdgeInsets.all(8),
                                  child: CustomText(
                                    text: "${controller.usermodel!.descritption}" ?? "",
                                    fontSize: FontSize.s15,
                                    maxLines: 10,
                                    fontWeight: FontWeight.normal,

                                  ),
                                )// Data cell content
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            const TableCell(
                                child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: CustomText(
                                    text: "Charge",
                                    fontSize: FontSize.s15,
                                    maxLines: 10,
                                  ),
                                )// Data cell content
                            ),
                            TableCell(
                                child: Padding(
                                  padding:const EdgeInsets.all(8),
                                  child: CustomText(
                                    text: "${controller.usermodel!.charge}" ?? "",
                                    fontSize: FontSize.s15,
                                    maxLines: 10,
                                    fontWeight: FontWeight.normal,
                                  ),
                                )// Data cell content
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            const TableCell(
                                child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: CustomText(
                                    text: "Gender",
                                    fontSize: FontSize.s15,
                                    maxLines: 10,
                                  ),
                                )// Data cell content
                            ),
                            TableCell(
                                child: Padding(
                                  padding:const EdgeInsets.all(8),
                                  child: CustomText(
                                    text: "${controller.usermodel!.gender}" ?? "",
                                    fontSize: FontSize.s15,
                                    maxLines: 10,
                                    fontWeight: FontWeight.normal,
                                  ),
                                )// Data cell content
                            ),
                          ],
                        ),

                        // Add more TableRow widgets for additional rows of data
                      ],
                    )

                  ],
                ),
              ),
            ),

            if(controller.isLoading.value) CustomLoader()
          ],
        )),
      bottomNavigationBar: Container(
        height: 56,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Row(
          children: <Widget>[

            Expanded(
              child: Row(
                children: [
                  InkWell(
                    onTap: ()async{

                      // var fcmToken = await FirebaseMessaging.instance.getToken();
                      // print("fcmtoken = ${fcmToken}");
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ColorManager.primary,
                      ),

                      width: 60,
                      child: Icon(Icons.phone_outlined,color: ColorManager.white,size: 20,),
                    ),
                  ),
                  SizedBox(width: 10,),
                  InkWell(
                    onTap: ()async{

                      // var fcmToken = await FirebaseMessaging.instance.getToken();
                      // print("fcmtoken = ${fcmToken}");
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ColorManager.primary,
                      ),
                      width: 60,
                      child: Icon(Icons.message_outlined,color: ColorManager.white,size: 20,),
                    ),
                  ),
                  SizedBox(width: 10,),
                  InkWell(
                    onTap: ()async{

                    },
                    child: Container(
                      width: 190,
                      alignment: Alignment.center,

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ColorManager.primary,
                      ),
                      child: CustomText(text: "BOOK NOW",color: ColorManager.white,fontSize: 16,fontWeight: FontWeight.w500,),
                    ),
                  ),
                ],
              )
            ),
            SizedBox(height: 10,)
          ],
        ),
      ),

    );
  }
}
