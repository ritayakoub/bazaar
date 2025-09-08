import 'package:bazaar2/core/const_data/app_colors.dart';
import 'package:bazaar2/core/const_data/app_image.dart';
import 'package:bazaar2/core/service/media_query.dart';
import 'package:bazaar2/view/splash/controller/splashcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    MediaQueryUtil.init(context);
    return Scaffold(
      backgroundColor: AppColors.primaryOrangeColor,
      body: Center(
        child: Image.asset(
          AppImages.appIcon,
          width: MediaQueryUtil.screenWidth / 1.98,
        ),
      ),
    );
  }
}
