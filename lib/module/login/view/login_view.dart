import 'package:crud_http_api_danu/module/login/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/login_button.dart';
import '../widget/login_checkbox.dart';
import '../widget/login_textform.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  void dispose() {
    Get.delete<LoginController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    LoginController controller = Get.put(LoginController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: const NetworkImage(
              'https://img.freepik.com/free-photo/stylish-soft-blue-curve-lines-abstract-background_1017-19950.jpg?w=1480&t=st=1669800139~exp=1669800739~hmac=12f673d394037443e402c2bf464c270a712c8f26886ba9d0ec604c1117c69f73',
            ),
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.2),
              BlendMode.modulate,
            ),
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(40),
          children: [
            const SizedBox(height: 150),
            const LoginTextForm(),
            const LoginCheckbox(),
            const SizedBox(height: 50.0),
            const LoginButton(),
            const SizedBox(height: 40),
            Text(
              'App Ver 1.0.0 - 20013FEA68CC820C',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
