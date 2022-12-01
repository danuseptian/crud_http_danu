import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ProductService {
  static List productList = [];

  static loadProductList() async {
    productList = await getProduct();
  }

  static Future<List> getProduct() async {
    var response = await Dio().get(
      "http://capekngoding.com:8080/danu/api/products",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    Map obj = response.data;
    if (kDebugMode) {
      print(obj);
    }
    List products = obj["data"];
    return products;
  }

  static Future postProduct({required String name, required String job}) async {
    var response = await Dio().post(
      "http://capekngoding.com:8080/danu/api/products",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
      data: {
        'name': name,
        'job': job,
      },
    );
    Map obj = response.data;
    if (kDebugMode) {
      print(obj);
    }
  }

  static Future deleteProduct({required int id}) async {
    var response = await Dio().delete(
      "http://capekngoding.com:8080/danu/api/products/$id",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    if (kDebugMode) {
      print(response.statusCode);
    }

    await getProduct();
  }
}
