import 'package:bazaar2/core/const_data/app_colors.dart';
import 'package:bazaar2/core/const_data/font_family.dart';
import 'package:bazaar2/view/Dashboard_home/widgets/ProductCard.dart';
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
    final controller = Get.find<ProductController>();
    final controllerH = Get.put(HomeController());

    return Scaffold(
      appBar: DefaultAppBar(onMenuTap: controllerH.toggleDrawer),
      drawer: CustomDrawer(
        width: MediaQueryUtil.screenWidth * 0.75,
        onClose: () => Navigator.of(context).pop(),
      ),
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQueryUtil.screenHeight / 52.75,
          left: MediaQueryUtil.screenWidth / 20.6,
          right: MediaQueryUtil.screenWidth / 20.6,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Title + Count
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Product",
                  style: TextStyle(
                    fontFamily: FontFamily.russoOne,
                    fontSize: MediaQueryUtil.screenWidth / 19,
                  ),
                ),
                Obx(
                  () => Text(
                    controller.myOwnProducts.length.toString(),
                    style: TextStyle(
                      fontSize: MediaQueryUtil.screenWidth / 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: MediaQueryUtil.screenHeight / 30),

            /// Grid with Refresh
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  const Center(child: CircularProgressIndicator());
                }
                return RefreshIndicator(
                  onRefresh: () async {
                    await controller.loadOwnProducts();
                  },
                  child: GridView.builder(
                    physics: const AlwaysScrollableScrollPhysics(), // مهم للسحب
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: MediaQueryUtil.screenHeight / 3.8,
                      crossAxisSpacing: MediaQueryUtil.screenWidth / 27.46,
                      mainAxisSpacing: MediaQueryUtil.screenHeight / 49.64,
                    ),
                    itemCount: controller.myOwnProducts.length,
                    itemBuilder: (context, index) {
                      return CustomProductCard(
                        data: controller.myOwnProducts[index],
                      );
                    },
                  ),
                );
              }),
            ),
          ],
        ),
      ),

      /// Floating Button
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryOrangeColor,
        onPressed: () {
          Get.to(() => const AddProductPage());
        },
        child: const Icon(
          Icons.add,
          color: AppColors.white,
        ),
      ),
    );
  }
}
