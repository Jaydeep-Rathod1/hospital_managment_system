import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/departments_controller.dart';

class DepartmentsView extends GetView<DepartmentsController> {
  const DepartmentsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DepartmentsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DepartmentsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
