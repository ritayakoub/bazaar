import 'package:bazaar2/core/const_data/app_colors.dart';
import 'package:bazaar2/core/const_data/app_image.dart';
import 'package:bazaar2/core/const_data/font_family.dart';
import 'package:bazaar2/view/Dashboard_home/controller/dashboard_controller.dart';
import 'package:bazaar2/view/account/controller/accountcontroller.dart';
import 'package:bazaar2/view/account/screen/account.dart';
import 'package:bazaar2/view/store/screen/createstore.dart';
import 'package:bazaar2/view/Store_Order/screen/storeorderall.dart';
import 'package:bazaar2/view/bazzardetails/screen/bazzarscren.dart';
import 'package:bazaar2/view/home/widgets/drawerlisttile.dart';
import 'package:bazaar2/view/product/screen/noproduct.dart';
import 'package:bazaar2/view/requestbazzar/screen/screenrequest.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/service/media_query.dart';

class CustomDrawer extends StatelessWidget {
  final double width;
  final VoidCallback onClose;

  const CustomDrawer({super.key, required this.width, required this.onClose});

  @override
  Widget build(BuildContext context) {
    AccountController accountController = Get.find<AccountController>();
    return Material(
      elevation: MediaQueryUtil.screenWidth / 41.2,
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
      child: Container(
        width: width,
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: MediaQueryUtil.screenHeight / 20,
                left: MediaQueryUtil.screenWidth / 20.6,
                right: MediaQueryUtil.screenWidth / 20.6,
              ),
              child: Row(children: [
                CircleAvatar(
                  radius: MediaQueryUtil.screenWidth / 18,
                  backgroundColor: Colors.grey.shade200,
                  child: ClipOval(
                    child: accountController.profileImageUrl.isNotEmpty
                        ? CachedNetworkImage(
                            imageUrl: accountController.profileImageUrl.value,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                            placeholder: (context, url) => const Center(
                              child: CircularProgressIndicator(strokeWidth: 2),
                            ),
                            errorWidget: (context, url, error) => Image.asset(
                              AppImages.profilephoto,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          )
                        : Image.asset(
                            AppImages.profilephoto,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                  ),
                ),
                SizedBox(width: MediaQueryUtil.screenWidth / 25),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Get.find<AccountController>().nameController.text,
                        style: TextStyle(
                            fontSize: MediaQueryUtil.screenWidth / 18.3,
                            color: AppColors.black70),
                      ),
                      GestureDetector(
                        onTap: () => Get.to(const Account()),
                        child: Text(
                          "view profile",
                          style: TextStyle(
                              fontSize: MediaQueryUtil.screenWidth / 30.3,
                              color: AppColors.black70),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Wrap(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: MediaQueryUtil.screenHeight / 28,
                        left: MediaQueryUtil.screenWidth / 20.6,
                        right: MediaQueryUtil.screenWidth / 20.6,
                      ),
                      child: Text(
                        'Store',
                        style: TextStyle(
                          fontSize: MediaQueryUtil.screenWidth / 15.3,
                          fontFamily: FontFamily.russoOne,
                        ),
                      ),
                    ),
                    Drawerlisttile(
                        title: "Details",
                        onTap: () {
                          onClose();
                          Get.to(() => const Createstore());
                        }),
                    Drawerlisttile(
                      title: "Products",
                      onTap: () {
                        onClose();
                        Get.to(() => const NoProductPage());
                      },
                    ),
                    Drawerlisttile(
                      title: "Orders",
                      onTap: () {
                        onClose();
                        Get.to(() => const Storeorderall());
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8),
                      child: Text(
                        'Bazaars',
                        style: TextStyle(
                          fontSize: MediaQueryUtil.screenWidth / 15.3,
                          fontFamily: FontFamily.russoOne,
                        ),
                      ),
                    ),
                    Drawerlisttile(
                      title: "Details",
                      onTap: () {
                        onClose();
                        Get.to(() => const Bazzarscren());
                      },
                    ),
                    const Drawerlisttile(
                      title: "Orders",
                    ),
                    Drawerlisttile(
                        title: "Requests",
                        onTap: () {
                          onClose();
                          Get.to(() => const Screenrequest());
                        }),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: MaterialButton(
                  onPressed: () {
                    Get.find<DashboardController>().logout();
                  },
                  color: AppColors.primaryOrangeColor,
                  height: MediaQueryUtil.screenHeight / 20.58,
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        MediaQueryUtil.screenWidth / 51.5),
                  ),
                  child: Text(
                    "Log Out",
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: MediaQueryUtil.screenWidth / 25.75,
                      fontFamily: FontFamily.montserrat,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
