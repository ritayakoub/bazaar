// ignore: file_names
import 'package:bazaar2/core/const_data/app_colors.dart';

import 'package:bazaar2/core/const_data/font_family.dart';
import 'package:bazaar2/core/service/media_query.dart';

import 'package:bazaar2/view/home/model/productmodel.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product data;
  const ProductCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      // Get.toNamed(Routes.productDetails, arguments: {"id": data.id}),
      child: Container(
        height: MediaQueryUtil.screenHeight / 1,
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius:
                BorderRadius.circular(MediaQueryUtil.screenWidth / 51.5)),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(9),
                  child: Image.asset(
                    data.image,
                    height: MediaQueryUtil.screenHeight / 5.41,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                )
              ],
            ),
            SizedBox(height: MediaQueryUtil.screenHeight / 80),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQueryUtil.screenWidth / 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.name,
                          style: TextStyle(
                              fontSize: MediaQueryUtil.screenWidth / 24,
                              color: AppColors.black,
                              fontFamily: FontFamily.russoOne),
                        ),
                        Row(
                          children: [
                            Text(data.markerName,
                                style: TextStyle(
                                    color: AppColors.obacity60black,
                                    fontSize: MediaQueryUtil.screenWidth / 25)),
                            SizedBox(
                              width: MediaQueryUtil.screenWidth / 10,
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Text(
                                    '\$',
                                    style: TextStyle(
                                        fontSize:
                                            MediaQueryUtil.screenWidth / 30,
                                        color: AppColors.black,
                                        fontFamily: FontFamily.russoOne),
                                  ),
                                  Text(
                                    '${data.price} ',
                                    style: TextStyle(
                                        fontSize:
                                            MediaQueryUtil.screenWidth / 22,
                                        color: AppColors.black,
                                        fontFamily: FontFamily.russoOne),
                                  ),
                                  Text(
                                    'k',
                                    style: TextStyle(
                                        fontSize:
                                            MediaQueryUtil.screenWidth / 22,
                                        color: AppColors.black,
                                        fontFamily: FontFamily.russoOne),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
