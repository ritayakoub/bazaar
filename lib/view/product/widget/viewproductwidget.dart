import 'dart:ui';

import 'package:bazaar2/core/const_data/app_colors.dart';
import 'package:bazaar2/core/const_data/app_image.dart';
import 'package:bazaar2/core/const_data/font_family.dart';

import 'package:bazaar2/core/service/media_query.dart';
import 'package:bazaar2/view/home/model/productmodel.dart';

import 'package:bazaar2/view/product/controller/product_controller.dart';
import 'package:bazaar2/view/product/controller/productdetailscontroller.dart';
import 'package:bazaar2/view/product/screen/AddProductPage.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewProductWidget extends StatelessWidget {
  final String id;
  const ViewProductWidget({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    Get.put(ProductDetailsController(id));

    return Scaffold(body: GetBuilder<ProductDetailsController>(
      builder: (controller) {
        if (controller.isLoadingFetching) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.product == null) {
          return Scaffold(
            body: Center(
              child: Text(
                'Product not found',
                style: TextStyle(
                  fontSize: MediaQueryUtil.screenWidth / 25.75,
                  color: AppColors.black60,
                ),
              ),
            ),
          );
        }

        return _buildProductDetails(controller.product!);
      },
    ));
  }

  Widget _buildProductDetails(Product product) {
    return Stack(
      children: [
        _buildProductContent(product),
        _buildBottomActionBar(),
      ],
    );
  }

  Widget _buildProductContent(Product product) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          right: 20,
          left: 20,
          top: 20,
          bottom: MediaQueryUtil.screenHeight / 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProductImage(product),
            SizedBox(height: MediaQueryUtil.screenHeight / 40),
            _buildProductNameAndDetails(product),
            SizedBox(height: MediaQueryUtil.screenHeight / 30),
            _buildProductMetrics(product),
            SizedBox(height: MediaQueryUtil.screenHeight / 50),
            _buildReviewsSection(product),
          ],
        ),
      ),
    );
  }

  Widget _buildProductImage(Product product) {
    return CachedNetworkImage(
      imageUrl: product.image,
      fit: BoxFit.cover,
      height: MediaQueryUtil.screenHeight / 2.11,
      width: double.infinity,
      placeholder: (context, url) => const Center(
        child: CircularProgressIndicator(strokeWidth: 2),
      ),
      errorWidget: (context, url, error) => Image.asset(
        AppImages.productPhoto,
        fit: BoxFit.cover,
        height: MediaQueryUtil.screenHeight / 2.11,
        width: double.infinity,
      ),
    );
  }

  Widget _buildProductNameAndDetails(Product product) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.name,
          style: TextStyle(
            fontSize: MediaQueryUtil.screenWidth / 17.16,
            fontFamily: FontFamily.russoOne,
          ),
        ),
        Text(
          product.details,
          style: TextStyle(
            fontSize: MediaQueryUtil.screenWidth / 25.75,
            color: AppColors.black70,
          ),
        ),
      ],
    );
  }

  Widget _buildProductMetrics(Product product) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildMetricColumn("Cost", "0", "\$"),
        _buildMetricColumn("Price", product.price.toString(), " \$"),
        _buildQuantityColumn(),
      ],
    );
  }

  Widget _buildMetricColumn(String title, String value, String symbol) {
    return Flexible(
      flex: 1,
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: MediaQueryUtil.screenWidth / 17.16,
              fontFamily: FontFamily.russoOne,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius:
                  BorderRadius.circular(MediaQueryUtil.screenWidth / 51.5),
            ),
            alignment: Alignment.center,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: value,
                    style: TextStyle(
                      fontSize: MediaQueryUtil.screenWidth / 17.16,
                      color: AppColors.black60,
                    ),
                  ),
                  TextSpan(
                    text: symbol,
                    style: TextStyle(
                      fontSize: MediaQueryUtil.screenWidth / 25.75,
                      color: AppColors.black60,
                      fontFamily: FontFamily.russoOne,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuantityColumn() {
    return Flexible(
      flex: 1,
      child: Column(
        children: [
          Text(
            "Quantity",
            style: TextStyle(
              fontSize: MediaQueryUtil.screenWidth / 17.16,
              fontFamily: FontFamily.russoOne,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius:
                  BorderRadius.circular(MediaQueryUtil.screenWidth / 51.5),
            ),
            alignment: Alignment.center,
            child: Text(
              "1",
              style: TextStyle(
                fontSize: MediaQueryUtil.screenWidth / 17.16,
                color: AppColors.black60,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewsSection(Product product) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "User's Reviews",
          style: TextStyle(
            fontFamily: FontFamily.russoOne,
            fontSize: MediaQueryUtil.screenWidth / 17.16,
          ),
        ),
        SizedBox(height: MediaQueryUtil.screenHeight / 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Ratings',
              style: TextStyle(
                fontSize: MediaQueryUtil.screenWidth / 17.16,
                color: AppColors.primaryFontColor,
                fontFamily: FontFamily.russoOne,
              ),
            ),
            Row(
                children: List.generate(5, (index) {
              return Padding(
                  padding: EdgeInsets.only(
                    left: MediaQueryUtil.screenWidth / 103,
                  ),
                  child: Image.asset(
                      index < product.rating
                          ? AppImages.starIcon
                          : AppImages.unFilledStarIcon,
                      width: MediaQueryUtil.screenWidth / 17.16));
            }))
          ],
        ),
        SizedBox(height: MediaQueryUtil.screenHeight / 40.19),
      ],
    );
  }

  Widget _buildBottomActionBar() {
    return Positioned(
      bottom: MediaQueryUtil.screenHeight / 50,
      left: MediaQueryUtil.screenWidth / 40,
      right: MediaQueryUtil.screenWidth / 40,
      child: Row(
        children: [
          Expanded(
            child: MaterialButton(
              onPressed: () {
                Get.to(AddProductPage());
              },
              height: MediaQueryUtil.screenHeight / 20.58,
              color: AppColors.primaryOrangeColor,
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(MediaQueryUtil.screenWidth / 51.5),
              ),
              child: Text(
                'Edit',
                style: TextStyle(
                  fontSize: MediaQueryUtil.screenWidth / 25.75,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
          SizedBox(width: MediaQueryUtil.screenWidth / 50),
          _buildMoreOptionsButton(),
        ],
      ),
    );
  }

  Widget _buildMoreOptionsButton() {
    return Container(
      height: MediaQueryUtil.screenHeight / 20.58,
      width: MediaQueryUtil.screenHeight / 20.58,
      decoration: BoxDecoration(
        color: AppColors.primaryOrangeColor,
        borderRadius: BorderRadius.circular(MediaQueryUtil.screenWidth / 51.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: MediaQueryUtil.screenWidth / 51.5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: PopupMenuButton<String>(
        icon: const Icon(Icons.more_vert, color: Colors.white),
        onSelected: (String choice) {
          if (choice == 'Update Quantity') {
            // Handle update quantity
          } else if (choice == 'Remove From Store') {
            // Handle remove from store
          } else if (choice == 'Delete') {
            // Handle delete
          }
        },
        itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
          _buildPopupMenuItem(
            value: 'Update Quantity',
            child: Text(
              'Update Quantity',
              style: TextStyle(fontSize: MediaQueryUtil.screenWidth / 25),
            ),
            onTap: _showUpdateQuantityDialog,
          ),
          const PopupMenuDivider(),
          _buildPopupMenuItem(
            value: 'Remove From Store',
            child: Text(
              'Remove From Store',
              style: TextStyle(fontSize: MediaQueryUtil.screenWidth / 25),
            ),
          ),
          const PopupMenuDivider(),
          _buildPopupMenuItem(
            value: 'Delete',
            child: Text(
              'Delete',
              style: TextStyle(
                fontSize: MediaQueryUtil.screenWidth / 25,
                color: AppColors.red,
              ),
            ),
            onTap: () {
              Get.find<ProductController>().deleteProduct(id);
              Get.back();
            },
          ),
        ],
      ),
    );
  }

  PopupMenuItem<String> _buildPopupMenuItem({
    required String value,
    required Widget child,
    VoidCallback? onTap,
  }) {
    return PopupMenuItem<String>(
      value: value,
      onTap: onTap,
      child: child,
    );
  }

  void _showUpdateQuantityDialog() {
    showDialog(
      context: Get.context!,
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.3),
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: AlertDialog(
            backgroundColor: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(MediaQueryUtil.screenWidth / 30),
            ),
            title: Text(
              "Update Quantity",
              style: TextStyle(
                fontFamily: FontFamily.russoOne,
                fontSize: MediaQueryUtil.screenWidth / 17,
                color: AppColors.black,
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "put the number you want to add or you want to update quantity to",
                ),
                SizedBox(height: MediaQueryUtil.screenHeight / 100),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Current quantity 32",
                    hintStyle: const TextStyle(
                      color: AppColors.borderLightGrey,
                      fontFamily: FontFamily.montserrat,
                    ),
                    fillColor: AppColors.lightGrey,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          MediaQueryUtil.screenWidth / 30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: MediaQueryUtil.screenHeight / 100),
                Row(
                  children: [
                    MaterialButton(
                      elevation: 0,
                      color: AppColors.lightGrey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            MediaQueryUtil.screenWidth / 51.5),
                      ),
                      onPressed: () {},
                      child: const Text("Update To New"),
                    ),
                    SizedBox(width: MediaQueryUtil.screenWidth / 90),
                    Expanded(
                      child: MaterialButton(
                        elevation: 0,
                        color: AppColors.primaryOrangeColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              MediaQueryUtil.screenWidth / 51.5),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Add",
                          style: TextStyle(color: AppColors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
