import 'package:crud_http_api_danu/module/login/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginTextForm extends StatelessWidget {
  const LoginTextForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController());
    return Column(
      children: [
        TextField(
          textInputAction: TextInputAction.next,
          cursorColor: Colors.blue,
          controller: controller.usernameController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.blue,
                width: 2,
              ),
            ),
            hintText: 'Username',
            prefixIcon: Padding(
              padding: EdgeInsets.all(16.0),
              child: Icon(
                Icons.person,
                color: Colors.blue,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          textInputAction: TextInputAction.done,
          obscureText: true,
          cursorColor: Colors.blue,
          controller: controller.passwordController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.blue,
                width: 2,
              ),
            ),
            hintText: 'Password',
            prefixIcon: Padding(
              padding: EdgeInsets.all(16.0),
              child: Icon(
                Icons.lock,
                color: Colors.blue,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
