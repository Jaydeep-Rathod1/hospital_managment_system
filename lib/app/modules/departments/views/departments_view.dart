import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hospital_managment_system/app/resources/color_manager.dart';
import 'package:hospital_managment_system/app/resources/font_manager.dart';
import 'package:hospital_managment_system/app/widgets/text_custom.dart';

import '../controllers/departments_controller.dart';

class DepartmentsView extends GetView<DepartmentsController> {
  const DepartmentsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(text: 'Departments',fontSize: FontSize.s18,color: ColorManager.white,),
        centerTitle: true,
      ),
      body:GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 7/8,
        ),

        physics: ScrollPhysics(),
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
    );
  }
}
