import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/doctordetails_controller.dart';

class DoctordetailsView extends GetView<DoctordetailsController> {
  const DoctordetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DoctordetailsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DoctordetailsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
