import 'package:bazaar2/view/Store_Order/widget/widgetorderall.dart';
import 'package:bazaar2/view/home/widgets/CustomDrawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bazaar2/core/const_data/app_colors.dart';
import 'package:bazaar2/core/service/media_query.dart';
import 'package:bazaar2/view/home/controller/home_controller.dart';
import 'package:bazaar2/widget/defaultappbar.dart';

class Storeorderall extends StatelessWidget {
  const Storeorderall({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Scaffold(
      appBar: DefaultAppBar(
        onMenuTap: controller.toggleDrawer,
      ),
      drawer: CustomDrawer(
        width: MediaQueryUtil.screenWidth * 0.75, // أو أي عرض تحبيه
        onClose: () => controller.closeDrawer, // لإغلاق الـ Drawer
      ),
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
          padding: EdgeInsets.only(
            top: MediaQueryUtil.screenHeight / 74,
            left: MediaQueryUtil.screenWidth / 45,
            right: MediaQueryUtil.screenWidth / 100,
          ),
          child: const Widgetorderall()),
    );
  }
}
