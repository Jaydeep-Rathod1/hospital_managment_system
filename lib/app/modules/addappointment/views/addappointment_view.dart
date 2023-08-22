import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/addappointment_controller.dart';

class AddappointmentView extends GetView<AddappointmentController> {
  const AddappointmentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddappointmentView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AddappointmentView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
