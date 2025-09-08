import 'dart:ui';

import 'package:bazaar2/core/const_data/app_colors.dart';
import 'package:bazaar2/core/service/media_query.dart';
import 'package:bazaar2/view/Dashboard_home/screen/dashboard_screen.dart';
import 'package:bazaar2/view/home/controller/home_controller.dart';
import 'package:bazaar2/view/home/widgets/CustomDrawer.dart';
import 'package:bazaar2/widget/defaultappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryUtil.init(context);
    final controller = Get.put(HomeController());

    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        if (details.delta.dx > 10 && !controller.isDrawerOpen) {
          controller.openDrawer();
        } else if (details.delta.dx < -10 && controller.isDrawerOpen) {
          controller.closeDrawer();
        }
      },
      child: Stack(
        children: [
          Scaffold(
            appBar: DefaultAppBar(onMenuTap: controller.toggleDrawer),
            drawer: CustomDrawer(
              width: MediaQueryUtil.screenWidth * 0.75, // أو أي عرض تحبيه
              onClose: () => controller.closeDrawer, // لإغلاق الـ Drawer
            ),
            backgroundColor: AppColors.backgroundColor,
            body: Padding(
                padding: EdgeInsets.only(
                  top: MediaQueryUtil.screenHeight / 52.75,
                  left: MediaQueryUtil.screenWidth / 20.6,
                  right: MediaQueryUtil.screenWidth / 20.6,
                ),
                child: const DashboardScreen()),
          ),
          GetBuilder<HomeController>(
            builder: (controller) => controller.isDrawerOpen
                ? GestureDetector(
                    onTap: controller.closeDrawer,
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                      child: const SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ),
          GetBuilder<HomeController>(
            builder: (controller) => AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              top: 0,
              bottom: 0,
              left: controller.isDrawerOpen ? 0 : -controller.drawerWidth,
              child: Material(
                elevation: MediaQueryUtil.screenWidth / 41.2,
                child: CustomDrawer(
                  width: controller.drawerWidth,
                  onClose: controller.closeDrawer,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
