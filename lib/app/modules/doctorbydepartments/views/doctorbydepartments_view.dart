import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hospital_managment_system/app/widgets/custom_loader.dart';

import '../controllers/doctorbydepartments_controller.dart';

class DoctorbydepartmentsView extends GetView<DoctorbydepartmentsController> {
  const DoctorbydepartmentsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var departmentModel = controller.departmentModel;
    return Scaffold(
      appBar: AppBar(
        title: const Text('DoctorbydepartmentsView'),
        centerTitle: true,
      ),
      body: Obx(()=>Stack(
        children: [
          if(controller.isLoading.value) CustomLoader()
        ],
      ))
    );
  }
}
