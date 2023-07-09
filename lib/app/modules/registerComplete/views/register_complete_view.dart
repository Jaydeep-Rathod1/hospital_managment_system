import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/register_complete_controller.dart';

class RegisterCompleteView extends GetView<RegisterCompleteController> {
  const RegisterCompleteView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RegisterCompleteView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'RegisterCompleteView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
