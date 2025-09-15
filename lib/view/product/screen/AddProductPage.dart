import 'package:bazaar2/core/const_data/app_image.dart';
import 'package:bazaar2/core/service/media_query.dart';
import 'package:bazaar2/view/home/controller/home_controller.dart';
import 'package:bazaar2/view/home/model/productmodel.dart';
import 'package:bazaar2/view/product/controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/const_data/app_colors.dart';
import '../../../core/const_data/font_family.dart';
import '../../../widget/defaultappbar.dart';

class AddProductPage extends StatelessWidget {
  const AddProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProductController>();
    final controllerH = Get.put(HomeController());

    return Scaffold(
      appBar: DefaultAppBar(
        onMenuTap: controllerH.toggleDrawer,
      ),

      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQueryUtil.screenHeight / 52.75,
          left: MediaQueryUtil.screenWidth / 20.6,
          right: MediaQueryUtil.screenWidth / 20.6,
        ),
        child: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Add New Product",
                  style: TextStyle(
                    fontSize: MediaQueryUtil.screenWidth / 15.45,
                    fontFamily: FontFamily.russoOne,
                  ),
                ),
                Text(
                  "Photo",
                  style: TextStyle(
                    fontSize: MediaQueryUtil.screenWidth / 22,
                    color: AppColors.darkGrey,
                    fontFamily: FontFamily.montserrat,
                  ),
                ),
                Obx(() {
                  return GestureDetector(
                    onTap: () {
                      controller.pickImage(ImageSource.gallery);
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
                          MediaQueryUtil.screenWidth / 51.5,
                        ),
                        color: AppColors.white,
                      ),
                      child: controller.selectedImage.value == null
                          ? Center(
                              child: Image.asset(
                                AppImages.aboutAppIcon,
                                color: AppColors.lightGrey,
                                width: MediaQueryUtil.screenWidth / 15,
                              ),
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(
                                MediaQueryUtil.screenWidth / 51.5,
                              ),
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
                        ? 'Enter product name'
                        : null,
                    controller: controller.name,
                    decoration: InputDecoration(
                      hintText: "Women's Bag",
                      hintStyle: const TextStyle(
                        color: AppColors.borderLightGrey,
                        fontFamily: FontFamily.montserrat,
                      ),
                      fillColor: AppColors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            MediaQueryUtil.screenWidth / 51.5),
                        borderSide:
                            const BorderSide(color: AppColors.borderLightGrey),
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
                    "Description",
                    style: TextStyle(
                        fontSize: MediaQueryUtil.screenWidth / 22,
                        color: AppColors.darkGrey,
                        fontFamily: FontFamily.montserrat),
                  ),
                ),
                TextFormField(
                    controller: controller.description,
                    validator: (value) => value == null || value.isEmpty
                        ? 'Enter description'
                        : null,
                    decoration: InputDecoration(
                      hintText: "Super light bag",
                      hintStyle: const TextStyle(
                        color: AppColors.borderLightGrey,
                        fontFamily: FontFamily.montserrat,
                      ),
                      fillColor: AppColors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            MediaQueryUtil.screenWidth / 51.5),
                        borderSide:
                            const BorderSide(color: AppColors.borderLightGrey),
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
                TextFormField(
                    controller: controller.category,
                    validator: (value) => value == null || value.isEmpty
                        ? 'Enter category'
                        : null,
                    decoration: InputDecoration(
                      hintText: "Books",
                      hintStyle: const TextStyle(
                        color: AppColors.borderLightGrey,
                        fontFamily: FontFamily.montserrat,
                      ),
                      fillColor: AppColors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            MediaQueryUtil.screenWidth / 51.5),
                        borderSide:
                            const BorderSide(color: AppColors.borderLightGrey),
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
                    "Quantity",
                    style: TextStyle(
                        fontSize: MediaQueryUtil.screenWidth / 22,
                        color: AppColors.darkGrey,
                        fontFamily: FontFamily.montserrat),
                  ),
                ),
                TextFormField(
                    controller: controller.quantity,
                    keyboardType: TextInputType.number,
                    validator: (value) => value == null || value.isEmpty
                        ? 'Enter quantity'
                        : null,
                    decoration: InputDecoration(
                      hintText: "20",
                      hintStyle: const TextStyle(
                        color: AppColors.borderLightGrey,
                        fontFamily: FontFamily.montserrat,
                      ),
                      fillColor: AppColors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                            MediaQueryUtil.screenWidth / 51.5),
                        borderSide:
                            const BorderSide(color: AppColors.borderLightGrey),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              MediaQueryUtil.screenWidth / 51.5),
                          borderSide: const BorderSide(
                              color: AppColors.borderLightGrey)),
                    )),
                Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: MediaQueryUtil.screenHeight / 42,
                              bottom: MediaQueryUtil.screenHeight / 100,
                            ),
                            child: Text(
                              "Cost",
                              style: TextStyle(
                                fontSize: MediaQueryUtil.screenWidth / 22,
                                color: AppColors.darkGrey,
                                fontFamily: FontFamily.montserrat,
                              ),
                            ),
                          ),
                          TextFormField(
                            validator: (value) => value == null || value.isEmpty
                                ? 'Enter cost'
                                : null,
                            controller: controller.cost,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: "120",
                              hintStyle: const TextStyle(
                                color: AppColors.borderLightGrey,
                                fontFamily: FontFamily.montserrat,
                              ),
                              suffixIcon: Padding(
                                  padding: EdgeInsets.all(
                                      MediaQueryUtil.screenWidth / 24),
                                  child: Icon(
                                    size: MediaQueryUtil.screenWidth / 16,
                                    Icons.attach_money_outlined,
                                    color: AppColors.black60,
                                  )),
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
                                    color: AppColors.borderLightGrey),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQueryUtil.screenWidth / 20,
                    ),
                    Flexible(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: MediaQueryUtil.screenHeight / 42,
                              bottom: MediaQueryUtil.screenHeight / 100,
                            ),
                            child: Text(
                              "Price",
                              style: TextStyle(
                                fontSize: MediaQueryUtil.screenWidth / 22,
                                color: AppColors.darkGrey,
                                fontFamily: FontFamily.montserrat,
                              ),
                            ),
                          ),
                          TextFormField(
                            validator: (value) => value == null || value.isEmpty
                                ? 'Enter price'
                                : null,
                            controller: controller.price,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: "199",
                              hintStyle: const TextStyle(
                                color: AppColors.borderLightGrey,
                                fontFamily: FontFamily.montserrat,
                              ),
                              suffixIcon: Padding(
                                  padding: EdgeInsets.all(
                                      MediaQueryUtil.screenWidth / 24),
                                  child: Icon(
                                    size: MediaQueryUtil.screenWidth / 16,
                                    Icons.attach_money_outlined,
                                    color: AppColors.black60,
                                  )),
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
                                    color: AppColors.borderLightGrey),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      // ... بقية الفورم تبعك (Name, Description, Category, Quantity, Cost, Price ...)

      // ✅ زر محفوظ بأسفل الصفحة مع خلفية بيضا
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQueryUtil.screenWidth / 20.6,
          vertical: MediaQueryUtil.screenHeight / 100,
        ),
        child: MaterialButton(
          onPressed: () async {
            if (controller.formKey.currentState!.validate()) {
              controller.createProduct();
            }
          },
          color: AppColors.primaryOrangeColor,
          padding: EdgeInsets.symmetric(
            horizontal: MediaQueryUtil.screenWidth / 8,
            vertical: MediaQueryUtil.screenHeight / 50,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              MediaQueryUtil.screenWidth / 51.5,
            ),
          ),
          child: Text(
            "Save",
            style: TextStyle(
              fontFamily: FontFamily.montserrat,
              color: AppColors.white,
              fontSize: MediaQueryUtil.screenWidth / 25.75,
            ),
          ),
        ),
      ),
    );
  }
}
