import 'package:bazaar2/core/const_data/app_colors.dart';
import 'package:bazaar2/view/product/controller/product_controller.dart';
import 'package:bazaar2/view/product/screen/noproduct.dart';
// تأكد من المسار الصحيح
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Checkproduct extends StatelessWidget {
  final controllerp = Get.put(ProductController());

  Checkproduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Obx(() {
        if (controllerp.isLoading.value) {
          return const SizedBox();
        } else if (controllerp.hasProducts.value) {
          return const Center(child: Text("✅ يوجد منتجات"));
        } else {
          Future.microtask(() {
            Get.off(() => const NoProductPage());
          });
          return const SizedBox();
        }
      }),
    );
  }
}
