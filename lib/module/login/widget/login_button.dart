import 'package:crud_http_api_danu/module/home/view/home_view.dart';
import 'package:crud_http_api_danu/module/login/controller/login_controller.dart';
import 'package:crud_http_api_danu/service/app_session.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../service/auth_service.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController());
    return GestureDetector(
      onTap: () async {
        await AuthService.login(
            username: controller.usernameController.text,
            password: controller.passwordController.text);
        if (AppSession.token != null) {
          Get.offAll(() => const HomeView());
        } else {
          Get.snackbar('Login Failed', 'Try Again');
        }
      },
      child: Container(
        alignment: Alignment.center,
        height: 45,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 0),
              blurRadius: 1,
              spreadRadius: 1,
              color: Colors.black26,
            ),
          ],
          color: Colors.blue,
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Text(
          'LOGIN',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
