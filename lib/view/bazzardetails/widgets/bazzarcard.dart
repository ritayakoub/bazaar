import 'package:bazaar2/core/const_data/app_colors.dart';
import 'package:bazaar2/core/const_data/app_image.dart';
import 'package:bazaar2/core/const_data/font_family.dart';
import 'package:bazaar2/core/service/media_query.dart';
import 'package:bazaar2/view/Dashboard_home/controller/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBazaarCard extends StatelessWidget {
  final dynamic data;
  const CustomBazaarCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => DashboardController());
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(MediaQueryUtil.screenWidth / 51.5),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            data.image,
            width: MediaQueryUtil.screenWidth / 3.81,
          ),
          SizedBox(width: MediaQueryUtil.screenWidth / 25.75),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: MediaQueryUtil.screenHeight / 52.75,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.name,
                    style: TextStyle(
                      fontSize: MediaQueryUtil.screenWidth / 22.8,
                      color: AppColors.black,
                      fontFamily: FontFamily.russoOne,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    data.details,
                    style: TextStyle(
                      fontSize: MediaQueryUtil.screenWidth / 41.2,
                      color: AppColors.darkGrey,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: MediaQueryUtil.screenHeight / 56.26),
                  Row(
                    children: [
                      Image.asset(
                        AppImages.bazaarClock,
                        width: MediaQueryUtil.screenWidth / 34.33,
                      ),
                      SizedBox(width: MediaQueryUtil.screenWidth / 51.5),
                      Text(
                        data.firstDate,
                        style: TextStyle(
                          fontSize: MediaQueryUtil.screenWidth / 41.2,
                          color: AppColors.black,
                        ),
                      ),
                      SizedBox(width: MediaQueryUtil.screenWidth / 20.6),
                      SizedBox(
                        width: MediaQueryUtil.screenWidth / 11.77,
                        child: const Divider(
                          color: AppColors.black,
                        ),
                      ),
                      SizedBox(width: MediaQueryUtil.screenWidth / 20.6),
                      Text(
                        data.lastDate,
                        style: TextStyle(
                          fontSize: MediaQueryUtil.screenWidth / 41.2,
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
