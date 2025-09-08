import 'package:bazaar2/core/const_data/app_colors.dart';
import 'package:bazaar2/core/const_data/app_image.dart';
import 'package:bazaar2/core/const_data/font_family.dart';
import 'package:bazaar2/core/service/media_query.dart';
import 'package:bazaar2/view/store/controller/createstore_controller.dart';
import 'package:bazaar2/view/store/widgets/store_details.dart';
import 'package:bazaar2/view/home/controller/home_controller.dart';
import 'package:bazaar2/widget/defaultappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Createstore extends StatelessWidget {
  const Createstore({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CreatestoreController(), permanent: true);

    final controllerH = Get.find<HomeController>();

    return Stack(children: [
      Scaffold(
          appBar: DefaultAppBar(
            onMenuTap: controllerH.toggleDrawer,
          ),
          backgroundColor: AppColors.backgroundColor,
          body: Stack(children: [
            Positioned(
              top: 30,
              left: -150,
              right: 20,
              child: Opacity(
                opacity: 0.05,
                child: Image.asset(
                  AppImages.bagIcon,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: MaterialButton(
                onPressed: () {
                  Get.off(() => StoreDetails());
                },
                color: AppColors.primaryOrangeColor,
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQueryUtil.screenWidth / 8,
                    vertical: MediaQueryUtil.screenHeight / 50),
                height: MediaQueryUtil.screenHeight / 20.58,
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        MediaQueryUtil.screenWidth / 51.5)),
                child: Text(
                  "Create My Store",
                  style: TextStyle(
                      fontFamily: FontFamily.montserrat,
                      color: AppColors.white,
                      fontSize: MediaQueryUtil.screenWidth / 25.75),
                ),
              ),
            )
          ]))
    ]);
  }
}
