import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/appointment_controller.dart';

class AppointmentView extends GetView<AppointmentController> {
  const AppointmentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppointmentView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AppointmentView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
