import 'package:bazaar2/core/const_data/app_colors.dart';
import 'package:bazaar2/core/const_data/app_image.dart';
import 'package:bazaar2/core/const_data/font_family.dart';
import 'package:bazaar2/core/service/media_query.dart';
import 'package:bazaar2/view/bazzardetails/controller/bazzarcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BazzarDetailsPage extends StatelessWidget {
  BazzarDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final BazzarController controller = Get.find();
    return Stack(children: [
      Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() {
              final image = controller.selectedImage.value;

              if (image != null) {
                return Container(
                  height: MediaQueryUtil.screenHeight / 5,
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
            SizedBox(
              height: MediaQueryUtil.screenHeight / 50,
            ),
            Text(
              controller.name.value,
              style: TextStyle(
                  fontSize: MediaQueryUtil.screenWidth / 17.6,
                  fontFamily: FontFamily.russoOne),
            ),
            Text(
              controller.description.value,
              style: TextStyle(
                  fontSize: MediaQueryUtil.screenWidth / 25.75,
                  color: AppColors.black70),
            ),
            SizedBox(
              height: MediaQueryUtil.screenHeight / 50,
            ),
            Text(
              "Categories",
              style: TextStyle(
                  fontSize: MediaQueryUtil.screenWidth / 17.16,
                  fontFamily: FontFamily.russoOne),
            ),
            // Categories
            Wrap(
              spacing: MediaQueryUtil.screenWidth / 51,
              children: controller.categories
                  .map((cat) => Chip(
                        label: Text(cat),
                        backgroundColor: AppColors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              MediaQueryUtil.screenWidth / 40),
                        ),
                      ))
                  .toList(),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Start Date ",
                          style: TextStyle(
                              fontSize: MediaQueryUtil.screenWidth / 21,
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
                            width: MediaQueryUtil.screenWidth / 3,
                            child: Text(controller.startDate.value,
                                style: TextStyle(
                                  fontSize: MediaQueryUtil.screenWidth / 19,
                                  color: AppColors.black60,
                                ))),
                      ],
                    )),
                Flexible(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("End Date ",
                            style: TextStyle(
                              fontFamily: FontFamily.russoOne,
                              fontSize: MediaQueryUtil.screenWidth / 21,
                            )),
                        Container(
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(
                                  MediaQueryUtil.screenWidth / 51.5),
                            ),
                            alignment: Alignment.center,
                            height: MediaQueryUtil.screenHeight / 18,
                            width: MediaQueryUtil.screenWidth / 3,
                            child: Text(controller.endDate.value,
                                style: TextStyle(
                                  fontSize: MediaQueryUtil.screenWidth / 19,
                                  color: AppColors.black60,
                                )))
                      ],
                    )),
              ],
            ),
            SizedBox(height: MediaQueryUtil.screenHeight / 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Start Sub ",
                          style: TextStyle(
                              fontSize: MediaQueryUtil.screenWidth / 21,
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
                            width: MediaQueryUtil.screenWidth / 3,
                            child: Text(controller.submissionStart.value,
                                style: TextStyle(
                                  fontSize: MediaQueryUtil.screenWidth / 19,
                                  color: AppColors.black60,
                                ))),
                      ],
                    )),
                Flexible(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("End Sub",
                            style: TextStyle(
                              fontFamily: FontFamily.russoOne,
                              fontSize: MediaQueryUtil.screenWidth / 21,
                            )),
                        Container(
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(
                                  MediaQueryUtil.screenWidth / 51.5),
                            ),
                            alignment: Alignment.center,
                            height: MediaQueryUtil.screenHeight / 19,
                            width: MediaQueryUtil.screenWidth / 3,
                            child: Text(controller.submissionEnd.value,
                                style: TextStyle(
                                  fontSize: MediaQueryUtil.screenWidth / 19,
                                  color: AppColors.black60,
                                )))
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

            SizedBox(height: MediaQueryUtil.screenHeight / 50),
            Row(
              children: [
                Text(
                    "Positiveness: ${(controller.positiveness.value * 100).toInt()}%"),
                SizedBox(height: MediaQueryUtil.screenHeight / 50),
                Expanded(
                  child: LinearProgressIndicator(
                    value: controller.positiveness.value,
                    color: Colors.green,
                  ),
                ),
              ],
            ),

            SizedBox(
              height: MediaQueryUtil.screenHeight / 50,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
          ],
        )),
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQueryUtil.screenWidth / 20.6,
            vertical: MediaQueryUtil.screenHeight / 100,
          ),
          child: MaterialButton(
            onPressed: () {},
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
        ),
      ),
    ]);
  }
}
