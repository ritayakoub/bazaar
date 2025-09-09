import 'package:bazaar2/core/const_data/app_image.dart';
import 'package:bazaar2/view/home/controller/home_controller.dart';
import 'package:bazaar2/view/store/widgets/Storecreated.dart';
import 'package:bazaar2/widget/defaultappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bazaar2/core/const_data/app_colors.dart';
import 'package:bazaar2/core/const_data/font_family.dart';

import 'package:bazaar2/core/service/media_query.dart';
import 'package:bazaar2/view/store/controller/createstore_controller.dart';

class StoreDetails extends StatelessWidget {
  StoreDetails({super.key});
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CreatestoreController>();
    final controllerH = Get.put(HomeController());

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: DefaultAppBar(
        onMenuTap: controllerH.toggleDrawer,
      ),
      body: Padding(
          padding: EdgeInsets.only(
            top: MediaQueryUtil.screenHeight / 52.75,
            left: MediaQueryUtil.screenWidth / 20.6,
            right: MediaQueryUtil.screenWidth / 20.6,
          ),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Store Details",
                    style: TextStyle(
                        fontSize: MediaQueryUtil.screenWidth / 15.45,
                        fontFamily: FontFamily.russoOne),
                  ),
                  Text(
                    "Photo",
                    style: TextStyle(
                        fontSize: MediaQueryUtil.screenWidth / 22,
                        color: AppColors.darkGrey,
                        fontFamily: FontFamily.montserrat),
                  ),
                  Obx(() {
                    return GestureDetector(
                      onTap: () {
                        controller.pickImage();
                      },
                      child: Container(
                        height: MediaQueryUtil.screenHeight / 5,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.darkGrey,
                            style: BorderStyle.solid,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(
                              MediaQueryUtil.screenWidth / 51.5),
                          color: AppColors.white,
                        ),
                        child: controller.selectedImage.value == null
                            ? Center(
                                child: Image.asset(
                                AppImages.aboutAppIcon,
                                color: AppColors.lightGrey,
                                width: MediaQueryUtil.screenWidth / 15,
                              ))
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    MediaQueryUtil.screenWidth / 51.5),
                                child: Image.file(
                                  controller.selectedImage.value!,
                                  fit: BoxFit.contain,
                                  width: double.infinity,
                                ),
                              ),
                      ),
                    );
                  }),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQueryUtil.screenHeight / 42,
                        bottom: MediaQueryUtil.screenHeight / 100),
                    child: Text(
                      "Name",
                      style: TextStyle(
                          fontSize: MediaQueryUtil.screenWidth / 22,
                          color: AppColors.darkGrey,
                          fontFamily: FontFamily.montserrat),
                    ),
                  ),
                  TextFormField(
                      validator: (value) => value == null || value.isEmpty
                          ? 'Enter store name'
                          : null,
                      controller: controller.nameController,
                      decoration: InputDecoration(
                        hintText: "Adidas",
                        hintStyle: const TextStyle(
                          color: AppColors.borderLightGrey,
                          fontFamily: FontFamily.montserrat,
                        ),
                        fillColor: AppColors.white,
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              MediaQueryUtil.screenWidth / 51.5),
                          borderSide: const BorderSide(
                              color: AppColors.borderLightGrey),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                MediaQueryUtil.screenWidth / 51.5),
                            borderSide: const BorderSide(
                                color: AppColors.borderLightGrey)),
                      )),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQueryUtil.screenHeight / 42,
                        bottom: MediaQueryUtil.screenHeight / 100),
                    child: Text(
                      "Brand Type",
                      style: TextStyle(
                          fontSize: MediaQueryUtil.screenWidth / 22,
                          color: AppColors.darkGrey,
                          fontFamily: FontFamily.montserrat),
                    ),
                  ),
                  TextFormField(
                      validator: (value) => value == null || value.isEmpty
                          ? 'Enter brand type'
                          : null,
                      controller: controller.brandTypeController,
                      decoration: InputDecoration(
                        hintText: "Clothing Brand",
                        hintStyle: const TextStyle(
                          color: AppColors.borderLightGrey,
                          fontFamily: FontFamily.montserrat,
                        ),
                        fillColor: AppColors.white,
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              MediaQueryUtil.screenWidth / 51.5),
                          borderSide: const BorderSide(
                              color: AppColors.borderLightGrey),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                MediaQueryUtil.screenWidth / 51.5),
                            borderSide: const BorderSide(
                                color: AppColors.borderLightGrey)),
                      )),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQueryUtil.screenHeight / 42,
                        bottom: MediaQueryUtil.screenHeight / 100),
                    child: Text(
                      "Category",
                      style: TextStyle(
                          fontSize: MediaQueryUtil.screenWidth / 22,
                          color: AppColors.darkGrey,
                          fontFamily: FontFamily.montserrat),
                    ),
                  ),
                  Obx(() => Wrap(
                        spacing: MediaQueryUtil.screenWidth / 51,
                        children: controller.categories
                            .map((cat) => Chip(
                                  label: Text(cat),
                                  backgroundColor:
                                      AppColors.settingsLightOrange,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        MediaQueryUtil.screenWidth / 40),
                                  ),
                                  deleteIcon: Icon(
                                    Icons.close,
                                    size: MediaQueryUtil.screenWidth / 22,
                                  ),
                                  deleteIconColor: AppColors.primaryOrangeColor,
                                  onDeleted: () =>
                                      controller.removeCategory(cat),
                                ))
                            .toList(),
                      )),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                            controller: controller.catController,
                            decoration: InputDecoration(
                              hintText: "food x , fast food x",
                              hintStyle: const TextStyle(
                                color: AppColors.borderLightGrey,
                                fontFamily: FontFamily.montserrat,
                              ),
                              fillColor: AppColors.white,
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    MediaQueryUtil.screenWidth / 51.5),
                                borderSide: const BorderSide(
                                    color: AppColors.borderLightGrey),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      MediaQueryUtil.screenWidth / 51.5),
                                  borderSide: const BorderSide(
                                      color: AppColors.borderLightGrey)),
                            )),
                      ),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          final text = controller.catController.text.trim();

                          if (text.isEmpty) return;

                          if (controller.categories.isEmpty) {
                            controller.addCategory(text);
                            controller.catController.clear();
                          } else {
                            ScaffoldMessenger.of(Get.context!).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "You can't add more than one category",
                                  style: TextStyle(
                                      fontFamily: FontFamily.montserrat,
                                      fontSize:
                                          MediaQueryUtil.screenWidth / 24),
                                ),
                                duration: const Duration(seconds: 3),
                              ),
                            );
                          }
                        },
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQueryUtil.screenHeight / 42,
                        bottom: MediaQueryUtil.screenHeight / 100),
                    child: Text(
                      "Location",
                      style: TextStyle(
                          fontSize: MediaQueryUtil.screenWidth / 22,
                          color: AppColors.darkGrey,
                          fontFamily: FontFamily.montserrat),
                    ),
                  ),
                ],
              ),
            ),
          )),
      bottomNavigationBar: Container(
          color: AppColors.white,
          padding: EdgeInsets.symmetric(
            horizontal: MediaQueryUtil.screenWidth / 20.6,
            vertical: MediaQueryUtil.screenHeight / 100,
          ),
          child: MaterialButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                Get.off(const Storecreated());
              }
            },
            color: AppColors.primaryOrangeColor,
            padding: EdgeInsets.symmetric(
              horizontal: MediaQueryUtil.screenWidth / 8,
              vertical: MediaQueryUtil.screenHeight / 50,
            ),
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(MediaQueryUtil.screenWidth / 51.5),
            ),
            child: Text(
              "Save",
              style: TextStyle(
                fontFamily: FontFamily.montserrat,
                color: AppColors.white,
                fontSize: MediaQueryUtil.screenWidth / 25.75,
              ),
            ),
          )),
    );
  }
}
