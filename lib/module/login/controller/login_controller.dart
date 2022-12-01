// ignore_for_file: unnecessary_overrides

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController usernameController =
      TextEditingController(text: 'admin@demo.com');
  TextEditingController passwordController =
      TextEditingController(text: '123456');
  @override
  void onInit() {
    usernameController;
    passwordController;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
  }
}
