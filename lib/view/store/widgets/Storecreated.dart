import 'dart:ui';
import 'package:bazaar2/core/const_data/app_colors.dart';
import 'package:bazaar2/core/const_data/font_family.dart';
import 'package:bazaar2/core/service/media_query.dart';
import 'package:bazaar2/view/home/controller/home_controller.dart';
import 'package:bazaar2/view/home/screen/home_screen.dart';
import 'package:bazaar2/view/home/widgets/CustomDrawer.dart';
import 'package:bazaar2/view/store/controller/createstore_controller.dart';
import 'package:bazaar2/view/store/widgets/store_details.dart';
import 'package:bazaar2/widget/defaultappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Storecreated extends StatelessWidget {
  final VoidCallback? onStoreDeleted; // دالة للتنبيه عند الحذف
  final VoidCallback? onStoreUpdated;
  const Storecreated({super.key, this.onStoreDeleted, this.onStoreUpdated});

  @override
  Widget build(BuildContext context) {
    final controllerh = Get.find<HomeController>();
    final controller = Get.find<CreatestoreController>();
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: DefaultAppBar(
        onMenuTap: controllerh.toggleDrawer,
      ),
      drawer: CustomDrawer(
        width: MediaQueryUtil.screenWidth * 0.75,
        onClose: () => controllerh.closeDrawer,
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQueryUtil.screenHeight / 52.75,
          left: MediaQueryUtil.screenWidth / 20.6,
          right: MediaQueryUtil.screenWidth / 20.6,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Obx(() {
            final image = controller.selectedImage.value;
            return Container(
              height: MediaQueryUtil.screenHeight / 3.5,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(MediaQueryUtil.screenWidth / 51.5),
                color: AppColors.white,
              ),
              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(MediaQueryUtil.screenWidth / 51.5),
                child: image != null
                    ? Image.file(
                        image,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      )
                    : Center(
                        child: Text(
                          "no photo chosen",
                          style: TextStyle(
                            fontSize: MediaQueryUtil.screenWidth / 20,
                            color: AppColors.darkGrey,
                            fontFamily: FontFamily.montserrat,
                          ),
                        ),
                      ),
              ),
            );
          }),
          Padding(
            padding: EdgeInsets.only(top: MediaQueryUtil.screenHeight / 52),
            child: Text(
              controller.nameController.text,
              style: TextStyle(
                  fontSize: MediaQueryUtil.screenWidth / 18.5,
                  color: AppColors.black,
                  fontFamily: FontFamily.russoOne),
            ),
          ),
          Text(
            controller.brandTypeController.text,
            style: TextStyle(
                fontSize: MediaQueryUtil.screenWidth / 20,
                color: AppColors.darkGrey),
          ),
          const SizedBox(height: 16),
          const SizedBox(height: 16),
          Text(
            "Product Categories",
            style: TextStyle(
              fontFamily: FontFamily.russoOne,
              fontSize: MediaQueryUtil.screenWidth / 18,
            ),
          ),
          SizedBox(height: MediaQueryUtil.screenHeight / 80),
          SizedBox(
            height: MediaQueryUtil.screenHeight / 18,
            child: Obx(() {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.categoryList.length,
                itemBuilder: (context, index) {
                  final categoryName =
                      controller.categoryList[index].categoryname;

                  return Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQueryUtil.screenWidth / 50,
                      vertical: MediaQueryUtil.screenHeight / 80,
                    ),
                    margin: EdgeInsets.symmetric(
                      horizontal: MediaQueryUtil.screenWidth / 50,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        categoryName,
                        style: TextStyle(
                          fontFamily: FontFamily.montserrat,
                          color: AppColors.primaryFontColor,
                          fontSize: MediaQueryUtil.screenWidth / 24,
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
          ),
          SizedBox(
            height: MediaQueryUtil.screenHeight / 8,
          ),
          SizedBox(
              width: MediaQueryUtil.screenWidth / 1,
              child: MaterialButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      barrierDismissible: true,
                      barrierColor: Colors.black.withOpacity(0.3),
                      builder: (BuildContext context) {
                        return BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                            child: AlertDialog(
                              backgroundColor: AppColors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    MediaQueryUtil.screenWidth / 30),
                              ),
                              title: Text(
                                "Are you sure you want to delete the store?",
                                style: TextStyle(
                                  fontSize: MediaQueryUtil.screenWidth / 20,
                                  color: AppColors.primaryFontColor,
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: const Text(
                                    "No",
                                    style: TextStyle(
                                        color: AppColors.primaryFontColor),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    controller.selectedImage.value = null;
                                    controller.nameController.clear();
                                    controller.brandTypeController.clear();
                                    controller.locationController.clear();
                                    controller.hasStore.value = false;
                                    onStoreDeleted?.call();
                                    Get.offAll(() =>
                                        const HomeScreen()); // العودة للصفحة الرئيسية
                                  },
                                  child: const Text(
                                    "Yes",
                                    style: TextStyle(
                                        color: AppColors.primaryFontColor),
                                  ),
                                ),
                              ],
                            ));
                      });
                  controller.hasStore.value = false;
                },
                color: AppColors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    MediaQueryUtil.screenWidth / 51.5,
                  ),
                ),
                child: Text(
                  "Delete Store",
                  style: TextStyle(
                    fontFamily: FontFamily.montserrat,
                    color: AppColors.white,
                    fontSize: MediaQueryUtil.screenWidth / 23,
                  ),
                ),
              ))
        ]),
      ),
      bottomNavigationBar: Container(
          color: AppColors.white,
          padding: EdgeInsets.symmetric(
            horizontal: MediaQueryUtil.screenWidth / 20.6,
            vertical: MediaQueryUtil.screenHeight / 100,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: MaterialButton(
                onPressed: () {},
                color: AppColors.borderLightGrey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    MediaQueryUtil.screenWidth / 51.5,
                  ),
                ),
                child: Text(
                  "Log out",
                  style: TextStyle(
                    fontFamily: FontFamily.montserrat,
                    color: AppColors.black,
                    fontSize: MediaQueryUtil.screenWidth / 25.75,
                  ),
                ),
              )),
              SizedBox(width: MediaQueryUtil.screenWidth / 20),
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    Get.off(StoreDetails());
                    onStoreUpdated?.call();
                  },
                  color: AppColors.primaryOrangeColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      MediaQueryUtil.screenWidth / 51.5,
                    ),
                  ),
                  child: Text(
                    "Edite",
                    style: TextStyle(
                      fontFamily: FontFamily.montserrat,
                      color: AppColors.white,
                      fontSize: MediaQueryUtil.screenWidth / 25.75,
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
