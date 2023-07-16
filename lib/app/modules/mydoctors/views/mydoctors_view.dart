import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/mydoctors_controller.dart';

class MydoctorsView extends GetView<MydoctorsController> {
  const MydoctorsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MydoctorsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MydoctorsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
