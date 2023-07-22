import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hospital_managment_system/app/resources/color_manager.dart';
import 'package:hospital_managment_system/app/resources/font_manager.dart';
import 'package:hospital_managment_system/app/routes/app_pages.dart';
import 'package:hospital_managment_system/app/widgets/custom_loader.dart';
import 'package:hospital_managment_system/app/widgets/elevated_button_custom.dart';
import 'package:hospital_managment_system/app/widgets/text_custom.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../controllers/departments_controller.dart';

class DepartmentsView extends GetView<DepartmentsController> {
  const DepartmentsView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: CustomText(text: 'Departments',fontSize: FontSize.s18,color: ColorManager.white,),
        centerTitle: true,
      ),

      body:  Obx(() => Stack(
        children: [

          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 3/4,
                crossAxisSpacing: 15, mainAxisSpacing: 15
            ),
                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: controller.departmentList.value.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: (){
                  Get.toNamed(Routes.DOCTORBYDEPARTMENTS,arguments: {"departmentModel" : controller.departmentList[index]});
                },
                child: Column(
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
                    Expanded(
                      child: CustomText(
                        text: controller.departmentList.value[index].name.toString(),
                        fontWeight: FontWeight.w500,
                        color: ColorManager.primary,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        textOverflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
              );
            },
          ),
          if(controller.isLoading.value) CustomLoader()


        ],
      ))

    );
  }
}
