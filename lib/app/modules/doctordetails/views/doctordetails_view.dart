import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/doctordetails_controller.dart';

class DoctordetailsView extends GetView<DoctordetailsController> {
  const DoctordetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Obx(()=>Text('${controller.doctorNameTitle.value ??"" }')),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: Get.mediaQuery.size.width,
              child: Row(
                children: [
                  Container(),
                  Column(
                    children: [

                    ],
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}
