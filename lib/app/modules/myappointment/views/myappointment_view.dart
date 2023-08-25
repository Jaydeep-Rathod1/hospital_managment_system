import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/myappointment_controller.dart';

class MyappointmentView extends GetView<MyappointmentController> {
  const MyappointmentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyappointmentView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MyappointmentView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
