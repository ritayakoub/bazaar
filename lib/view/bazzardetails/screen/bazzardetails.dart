import 'package:bazaar2/view/bazzardetails/controller/bazzarcontroller.dart';
import 'package:bazaar2/view/bazzardetails/widgets/bazzardetailspage.dart';
import 'package:bazaar2/view/bazzardetails/widgets/bazzaruser.dart';
import 'package:bazaar2/view/home/controller/home_controller.dart';
import 'package:bazaar2/view/home/widgets/CustomDrawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bazaar2/core/const_data/app_colors.dart';
import 'package:bazaar2/core/service/media_query.dart';
import 'package:bazaar2/widget/defaultappbar.dart';

class Bazzardetails extends StatelessWidget {
  const Bazzardetails({super.key});

  @override
  Widget build(BuildContext context) {
    final controllerH = Get.put(HomeController());
    final BazzarController controller = Get.find<BazzarController>();

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: DefaultAppBar(
        onMenuTap: controllerH.toggleDrawer,
      ),
      drawer: CustomDrawer(
        width: MediaQueryUtil.screenWidth * 0.75,
        onClose: () => controllerH.closeDrawer,
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQueryUtil.screenHeight / 52.75,
          left: MediaQueryUtil.screenWidth / 20.6,
          right: MediaQueryUtil.screenWidth / 20.6,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: MediaQueryUtil.screenWidth / 2.5,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              MediaQueryUtil.screenWidth / 51.5),
                        ),
                        backgroundColor: controller.selectedIndex.value == 0
                            ? AppColors.primaryOrangeColor
                            : AppColors.white,
                        foregroundColor: controller.selectedIndex.value == 0
                            ? Colors.white
                            : Colors.black,
                      ),
                      onPressed: () {
                        controller.changeIndex(0);
                      },
                      child: Text(
                        "Details",
                        style: TextStyle(
                          fontSize: MediaQueryUtil.screenWidth / 23.5,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQueryUtil.screenWidth / 2.5,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              MediaQueryUtil.screenWidth / 51.5),
                        ),
                        backgroundColor: controller.selectedIndex.value == 1
                            ? AppColors.primaryOrangeColor
                            : AppColors.white,
                        foregroundColor: controller.selectedIndex.value == 1
                            ? Colors.white
                            : Colors.black,
                      ),
                      onPressed: () {
                        controller.changeIndex(1);
                      },
                      child: Text(
                        "Users",
                        style: TextStyle(
                            fontSize: MediaQueryUtil.screenWidth / 23.5),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: MediaQueryUtil.screenHeight / 50),
            // استخدام IndexedStack للحفاظ على حالة الصفحات
            Expanded(
              child: Obx(
                () => IndexedStack(
                  index: controller.selectedIndex.value,
                  children: [
                    BazzarDetailsPage(),
                    const Bazzaruser(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
