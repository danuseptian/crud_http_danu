import 'package:crud_http_api_danu/module/login/view/login_view.dart';
import 'package:crud_http_api_danu/service/app_session.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../service/product_service.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    ProductService.loadProductList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await ProductService.postProduct(
              name: 'Danu Septian', job: 'Flutter Developer');
          await ProductService.loadProductList();
          setState(() {});
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      appBar: AppBar(
        title: const Text('HTTP CRUD API Example'),
        actions: [
          GestureDetector(
            onTap: () {
              AppSession.token = null;
              Get.offAll(() => const LoginView());
            },
            child: Container(
              margin: const EdgeInsets.only(
                right: 10,
              ),
              child: const Icon(
                Icons.logout,
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: ProductService.productList.length,
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          var item = ProductService.productList[index];
          return GestureDetector(
            onTap: () {},
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 20,
                ),
                child: Row(
                  children: [
                    const Icon(Icons.person),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${item['name']}',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${item['job']}',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () async {
                        await ProductService.deleteProduct(id: item["id"]);
                        await ProductService.loadProductList();
                        setState(() {});
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
