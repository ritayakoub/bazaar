import 'dart:ui';

import 'package:bazaar2/core/const_data/app_colors.dart';
import 'package:bazaar2/core/const_data/app_image.dart';
import 'package:bazaar2/core/const_data/font_family.dart';

import 'package:bazaar2/core/service/media_query.dart';

import 'package:bazaar2/view/product/controller/product_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Viewproductwidget extends StatelessWidget {
  final String id;
  const Viewproductwidget({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final ProductController controller = Get.find<ProductController>();
    return Stack(
      children: [
        Scaffold(
          backgroundColor: AppColors.backgroundColor,
          body: SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.only(
              right: 20,
              left: 20,
              top: 20,
              bottom:
                  MediaQueryUtil.screenHeight / 10, // حتى ما يغطي الزر المحتوى
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(() {
                  final image = controller.selectedImage.value;

                  if (image != null) {
                    return Container(
                      height: MediaQueryUtil.screenHeight / 3.5,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            MediaQueryUtil.screenWidth / 51.5),
                        color: AppColors.white,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                            MediaQueryUtil.screenWidth / 51.5),
                        child: Image.file(
                          image,
                          fit: BoxFit.fill,
                          width: double.infinity,
                        ),
                      ),
                    );
                  } else {
                    return const Text("not photo yet");
                  }
                }),
                SizedBox(height: MediaQueryUtil.screenHeight / 40),
                Text(
                  controller.name.text,
                  style: TextStyle(
                      fontSize: MediaQueryUtil.screenWidth / 17.16,
                      fontFamily: FontFamily.russoOne),
                ),
                Text(
                  controller.description.text,
                  style: TextStyle(
                      fontSize: MediaQueryUtil.screenWidth / 25.75,
                      color: AppColors.black70),
                ),
                SizedBox(height: MediaQueryUtil.screenHeight / 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                        flex: 1,
                        child: Column(
                          children: [
                            Text(
                              "Cost ",
                              style: TextStyle(
                                  fontSize: MediaQueryUtil.screenWidth / 17.16,
                                  fontFamily: FontFamily.russoOne),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(
                                    MediaQueryUtil.screenWidth / 51.5),
                              ),
                              alignment: Alignment.center,
                              height: MediaQueryUtil.screenHeight / 18,
                              width: MediaQueryUtil.screenWidth / 5,
                              child: RichText(
                                  text: TextSpan(
                                children: [
                                  TextSpan(
                                      text: controller.cost.text,
                                      style: TextStyle(
                                        fontSize:
                                            MediaQueryUtil.screenWidth / 17.16,
                                        color: AppColors.black60,
                                      )),
                                  TextSpan(
                                      text: '\$ ',
                                      style: TextStyle(
                                          fontSize: MediaQueryUtil.screenWidth /
                                              25.75,
                                          color: AppColors.black60,
                                          fontFamily: FontFamily.russoOne)),
                                ],
                              )),
                            ),
                          ],
                        )),
                    Flexible(
                        flex: 1,
                        child: Column(
                          children: [
                            Text("Price ",
                                style: TextStyle(
                                  fontFamily: FontFamily.russoOne,
                                  fontSize: MediaQueryUtil.screenWidth / 17.16,
                                )),
                            Container(
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(
                                    MediaQueryUtil.screenWidth / 51.5),
                              ),
                              alignment: Alignment.center,
                              height: MediaQueryUtil.screenHeight / 18,
                              width: MediaQueryUtil.screenWidth / 5,
                              child: RichText(
                                  text: TextSpan(
                                children: [
                                  TextSpan(
                                      text: controller.price.text,
                                      style: TextStyle(
                                        fontSize:
                                            MediaQueryUtil.screenWidth / 17.16,
                                        color: AppColors.black60,
                                      )),
                                  TextSpan(
                                      text: '\$ ',
                                      style: TextStyle(
                                          fontSize: MediaQueryUtil.screenWidth /
                                              25.75,
                                          color: AppColors.black60,
                                          fontFamily: FontFamily.russoOne)),
                                ],
                              )),
                            )
                          ],
                        )),
                    Flexible(
                        flex: 1,
                        child: Column(
                          children: [
                            Text("Quantity ",
                                style: TextStyle(
                                  fontFamily: FontFamily.russoOne,
                                  fontSize: MediaQueryUtil.screenWidth / 17.16,
                                )),
                            Container(
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(
                                    MediaQueryUtil.screenWidth / 51.5),
                              ),
                              alignment: Alignment.center,
                              height: MediaQueryUtil.screenHeight / 18,
                              width: MediaQueryUtil.screenWidth / 5,
                              child: RichText(
                                  text: TextSpan(
                                children: [
                                  TextSpan(
                                      text: controller.quantity.text,
                                      style: TextStyle(
                                        fontSize:
                                            MediaQueryUtil.screenWidth / 17.16,
                                        color: AppColors.black60,
                                      )),
                                ],
                              )),
                            )
                          ],
                        )),
                  ],
                ),
                SizedBox(height: MediaQueryUtil.screenHeight / 50),
                Text("User's Reviews ",
                    style: TextStyle(
                      fontFamily: FontFamily.russoOne,
                      fontSize: MediaQueryUtil.screenWidth / 17.16,
                    )),

                SizedBox(
                  height: MediaQueryUtil.screenHeight / 50,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Ratings',
                          style: TextStyle(
                              fontSize: MediaQueryUtil.screenWidth / 17.16,
                              color: AppColors.primaryFontColor,
                              fontFamily: FontFamily.russoOne)),
                      Row(
                          children: List.generate(5, (index) {
                        return Padding(
                            padding: EdgeInsets.only(
                              left: MediaQueryUtil.screenWidth / 103,
                            ),
                            child: Image.asset(AppImages.starIcon,
                                width: MediaQueryUtil.screenWidth / 17.16));
                      }))
                    ]),

                SizedBox(height: MediaQueryUtil.screenHeight / 40.19),

                // Obx(() {
                //   final product = controller.product.value;
                //   if (product == null) {
                //     return Text("j");
                //   }
                //   final hasComments = product.comments.isNotEmpty;
                //   final commentsToShow = hasComments
                //       ? product.comments.take(2).toList()
                //       : <Comment>[];
                //   return Column(children: [
                //     if (hasComments)
                //       ListView.builder(
                //           shrinkWrap: true,
                //           physics: const NeverScrollableScrollPhysics(),
                //           itemCount: commentsToShow.length,
                //           itemBuilder: (context, index) {
                //             final comment = commentsToShow[index];

                //             return GestureDetector(
                //                 onTap: () => Get.to(ProductComments()),
                //                 child: CommentWidget(
                //                     profilePhoto: comment.profilePhoto,
                //                     name: comment.name,
                //                     rating: comment.rating.toInt(),
                //                     comment: comment.comment));
                //           }),
                //     if (!hasComments)
                //       Center(
                //           child: Text('No Comments!',
                //               style: TextStyle(
                //                   fontSize: MediaQueryUtil.screenWidth / 25.75,
                //                   color: AppColors.black60))),
                //     MaterialButton(
                //         onPressed: () => Get.to(ProductComments()),
                //         color: AppColors.backgroundColor,
                //         elevation: 0.0,
                //         height: MediaQueryUtil.screenHeight / 32.46,
                //         minWidth: double.infinity,
                //         shape: RoundedRectangleBorder(
                //             borderRadius: BorderRadius.circular(
                //                 MediaQueryUtil.screenWidth / 103)),
                //         child: Text(hasComments ? 'Show all' : 'Add Comment',
                //             style: TextStyle(
                //                 fontSize: MediaQueryUtil.screenWidth / 34.33,
                //                 color: AppColors.black60)))
                //   ]);
                // })
              ],
            ),
          )),
        ),
        Positioned(
          bottom: MediaQueryUtil.screenHeight / 50,
          left: MediaQueryUtil.screenWidth / 40,
          right: MediaQueryUtil.screenWidth / 40,
          child: Row(
            children: [
              Expanded(
                child: MaterialButton(
                  onPressed: () {},
                  height: MediaQueryUtil.screenHeight / 20.58,
                  color: AppColors.primaryOrangeColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        MediaQueryUtil.screenWidth / 51.5),
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
              SizedBox(
                width: MediaQueryUtil.screenWidth / 50,
              ),
              Container(
                  height: MediaQueryUtil.screenHeight / 20.58,
                  width: MediaQueryUtil.screenHeight / 20.58, // مربع تقريبًا
                  decoration: BoxDecoration(
                    color: AppColors.primaryOrangeColor,
                    borderRadius: BorderRadius.circular(
                        MediaQueryUtil.screenWidth / 51.5),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          blurRadius: MediaQueryUtil.screenWidth / 51.5,
                          offset: const Offset(0, 2))
                    ],
                  ),
                  child: PopupMenuButton<String>(
                    icon: const Icon(Icons.more_vert,
                        color: Colors.white), // زر 3 نقاط
                    onSelected: (String choice) {
                      if (choice == 'Update Quantity') {
                      } else if (choice == 'Remove From Store') {
                      } else if (choice == 'Delete') {}
                    },
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<String>>[
                      PopupMenuItem<String>(
                        onTap: () {
                          showDialog(
                            context: context,
                            barrierDismissible: true,
                            barrierColor: Colors.black
                                .withOpacity(0.3), // تغبيش بسيط بالخلفية
                            builder: (BuildContext context) {
                              return BackdropFilter(
                                filter: ImageFilter.blur(
                                    sigmaX: 5, sigmaY: 5), // قوة التغبيش
                                child: AlertDialog(
                                  backgroundColor: AppColors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        MediaQueryUtil.screenWidth / 30),
                                  ),
                                  title: Text(
                                    "Update Quantity ",
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
                                      SizedBox(
                                          height: MediaQueryUtil.screenHeight /
                                              100),
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
                                                MediaQueryUtil.screenWidth /
                                                    30),
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                          height: MediaQueryUtil.screenHeight /
                                              100),
                                      Row(
                                        children: [
                                          MaterialButton(
                                            elevation: 0,
                                            color: AppColors.lightGrey,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      MediaQueryUtil
                                                              .screenWidth /
                                                          51.5),
                                            ),
                                            onPressed: () {},
                                            child: const Text("Update To New"),
                                          ),
                                          SizedBox(
                                              width:
                                                  MediaQueryUtil.screenWidth /
                                                      90),
                                          Expanded(
                                            child: MaterialButton(
                                              elevation: 0,
                                              color:
                                                  AppColors.primaryOrangeColor,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        MediaQueryUtil
                                                                .screenWidth /
                                                            51.5),
                                              ),
                                              onPressed: () {},
                                              child: const Text(
                                                "Add",
                                                style: TextStyle(
                                                    color: AppColors.white),
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        value: 'Update Quantity',
                        child: Text(
                          'Update Quantity',
                          style: TextStyle(
                              fontSize: MediaQueryUtil.screenWidth / 25),
                        ),
                      ),
                      const PopupMenuDivider(),
                      PopupMenuItem<String>(
                        value: 'Remove From Store',
                        child: Text(
                          'Remove From Store',
                          style: TextStyle(
                              fontSize: MediaQueryUtil.screenWidth / 25),
                        ),
                      ),
                      const PopupMenuDivider(),
                      PopupMenuItem<String>(
                        value: 'Delete',
                        onTap: () {
                          controller.deleteProduct(id);
                          Get.back();
                        },
                        child: Text(
                          'Delete',
                          style: TextStyle(
                              fontSize: MediaQueryUtil.screenWidth / 25,
                              color: AppColors.red),
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ],
    );
  }
}
