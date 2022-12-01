import 'package:crud_http_api_danu/service/app_session.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class AuthService {
  static Future login({
    required String username,
    required String password,
  }) async {
    try {
      var response = await Dio().post(
        "http://capekngoding.com:8080/danu/api/auth/action/login",
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
        data: {
          "email": username,
          "password": password,
        },
      );
      Map obj = response.data;
      if (kDebugMode) {
        print(obj);
      }
      AppSession.token = obj['data']['token'];
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
