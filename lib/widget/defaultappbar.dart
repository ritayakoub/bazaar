import 'package:bazaar2/core/const_data/app_colors.dart';
import 'package:bazaar2/core/const_data/app_image.dart';
import 'package:bazaar2/core/service/media_query.dart';
import 'package:bazaar2/core/service/routes.dart';
import 'package:bazaar2/view/account/controller/accountcontroller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onMenuTap;
  const DefaultAppBar({
    super.key,
    this.onMenuTap,
  });

  @override
  Widget build(BuildContext context) {
    MediaQueryUtil.init(context);
    return ClipRRect(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(MediaQueryUtil.screenHeight / 24.14),
      ),
      child: AppBar(
        backgroundColor: AppColors.white,
        scrolledUnderElevation: 0.0,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsets.only(top: MediaQueryUtil.screenHeight / 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Builder(
                builder: (context) => IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer(); // يفتح الـ Drawer
                  },
                  icon: Image.asset(
                    AppImages.hamburgerIcon,
                    width: MediaQueryUtil.screenWidth / 12.875,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => Get.toNamed(Routes.account),
                child: Obx(() {
                  AccountController accountController =
                      Get.find<AccountController>();
                  return CircleAvatar(
                    radius: MediaQueryUtil.screenWidth / 21,
                    backgroundColor: Colors.grey.shade200,
                    child: ClipOval(
                      child: accountController.profileImageUrl.isNotEmpty
                          ? CachedNetworkImage(
                              imageUrl: accountController.profileImageUrl.value,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: double.infinity,
                              placeholder: (context, url) => const Center(
                                child:
                                    CircularProgressIndicator(strokeWidth: 2),
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
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(MediaQueryUtil.screenHeight / 12);
}
