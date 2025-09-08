import 'package:bazaar2/core/const_data/app_colors.dart';
import 'package:bazaar2/core/const_data/font_family.dart';
import 'package:bazaar2/view/home/controller/home_controller.dart';
import 'package:bazaar2/view/home/widgets/CustomDrawer.dart';
import 'package:bazaar2/view/product/controller/product_controller.dart';
import 'package:bazaar2/view/product/screen/AddProductPage.dart';
import 'package:bazaar2/widget/defaultappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/service/media_query.dart';

class NoProductPage extends StatelessWidget {
  const NoProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    final controllerH = Get.put(HomeController());
    return Scaffold(
      appBar: DefaultAppBar(onMenuTap: controllerH.toggleDrawer),
      drawer: CustomDrawer(
        width: MediaQueryUtil.screenWidth * 0.75, // أو أي عرض تحبيه
        onClose: () => Navigator.of(context).pop(), // لإغلاق الـ Drawer
      ),
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
          padding: EdgeInsets.only(
            top: MediaQueryUtil.screenHeight / 52.75,
            left: MediaQueryUtil.screenWidth / 20.6,
            right: MediaQueryUtil.screenWidth / 20.6,
          ),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Product",
                    style: TextStyle(
                        fontFamily: FontFamily.russoOne,
                        fontSize: MediaQueryUtil.screenWidth / 19),
                  ),
                  Obx(() => Text(
                        controller.productCount.value.toString(),
                        style: TextStyle(
                            fontSize: MediaQueryUtil.screenWidth / 20,
                            fontWeight: FontWeight.bold),
                      )),
                ],
              ),
              SizedBox(height: MediaQueryUtil.screenHeight / 3),
              const Center(
                child: Text(
                  "No products Found",
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
            ],
          )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryOrangeColor,
        onPressed: () {
          Get.to(() => AddProductPage()); // انتقل لصفحة إضافة منتج
        },
        child: const Icon(
          Icons.add,
          color: AppColors.white,
        ),
      ),
    );
  }
}
