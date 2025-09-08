import 'package:bazaar2/core/const_data/font_family.dart';
import 'package:bazaar2/view/Dashboard_home/controller/dashboard_controller.dart';
import 'package:bazaar2/view/bazzardetails/screen/createbazzar.dart';
import 'package:bazaar2/view/bazzardetails/widgets/bazzarcard.dart';
import 'package:bazaar2/view/home/controller/home_controller.dart';
import 'package:bazaar2/view/home/widgets/CustomDrawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bazaar2/core/const_data/app_colors.dart';
import 'package:bazaar2/core/service/media_query.dart';

import 'package:bazaar2/widget/defaultappbar.dart';

class Bazzarscren extends StatelessWidget {
  const Bazzarscren({super.key});

  @override
  Widget build(BuildContext context) {
    final controllerh = Get.put(HomeController());
    final DashboardController controller = Get.find<DashboardController>();
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: DefaultAppBar(
        onMenuTap: controllerh.toggleDrawer,
      ),
      drawer: CustomDrawer(
        width: MediaQueryUtil.screenWidth * 0.75, // أو أي عرض تحبيه
        onClose: () => controllerh.closeDrawer, // لإغلاق الـ Drawer
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQueryUtil.screenHeight / 74,
          left: MediaQueryUtil.screenWidth / 45,
          right: MediaQueryUtil.screenWidth / 100,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQueryUtil.screenWidth / 20,
                  bottom: MediaQueryUtil.screenHeight / 100,
                  top: MediaQueryUtil.screenHeight / 78),
              child: Text(
                "Bazzars Created",
                style: TextStyle(
                    fontFamily: FontFamily.russoOne,
                    fontSize: MediaQueryUtil.screenWidth / 18),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQueryUtil.screenWidth / 20.6,
                ),
                itemCount: controller.bazaarCardItem.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQueryUtil.screenHeight / 49.64,
                    ),
                    child: CustomBazaarCard(
                        data: controller.bazaarCardItem[index]),
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryOrangeColor,
        onPressed: () {
          Get.to(() => CreateBazzar()); // انتقل لصفحة إضافة منتج
        },
        child: const Icon(
          Icons.add,
          color: AppColors.white,
        ),
      ),
    );
  }
}
