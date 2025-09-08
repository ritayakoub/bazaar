import 'package:bazaar2/core/const_data/app_colors.dart';
import 'package:bazaar2/core/const_data/font_family.dart';

import 'package:bazaar2/core/service/media_query.dart';
import 'package:bazaar2/view/Dashboard_home/controller/dashboard_controller.dart';
import 'package:bazaar2/view/home/controller/home_controller.dart';
import 'package:bazaar2/view/home/widgets/CustomDrawer.dart';
import 'package:bazaar2/view/requestbazzar/screen/requestproduct.dart';
import 'package:bazaar2/widget/defaultappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Screenrequest extends StatelessWidget {
  const Screenrequest({super.key});

  @override
  Widget build(BuildContext context) {
    final controllerh = Get.put(HomeController());
    final controller = Get.put(DashboardController());
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Requests",
              style: TextStyle(
                  fontFamily: FontFamily.russoOne,
                  fontSize: MediaQueryUtil.screenWidth / 16.2),
            ),
            Padding(
              padding: EdgeInsets.all(MediaQueryUtil.screenWidth / 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "User",
                    style: TextStyle(
                        fontSize: MediaQueryUtil.screenWidth / 22.5,
                        color: AppColors.black),
                  ),
                  SizedBox(
                    width: MediaQueryUtil.screenWidth / 100,
                  ),
                  Text(
                    "Date",
                    style: TextStyle(
                        fontSize: MediaQueryUtil.screenWidth / 22.5,
                        color: AppColors.black),
                  ),
                  Text(
                    "Products",
                    style: TextStyle(
                        fontSize: MediaQueryUtil.screenWidth / 22.5,
                        color: AppColors.black),
                  ),
                ],
              ),
            ),
            SizedBox(
                height: MediaQueryUtil.screenHeight / 1.8,
                child: Obx(
                  () => ListView.builder(
                      itemCount: controller.request.length,
                      itemBuilder: (context, index) {
                        final requests = controller.request[index];
                        return GestureDetector(
                            onTap: () {
                              Get.to(() => Requestproduct(
                                  request:
                                      requests)); // 👈 يوديك على صفحة ثانية
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                vertical: MediaQueryUtil.screenHeight / 120,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(
                                    MediaQueryUtil.screenWidth / 51.5),
                              ),
                              padding: EdgeInsets.only(
                                top: MediaQueryUtil.screenHeight / 60,
                                bottom: MediaQueryUtil.screenHeight / 60,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: CircleAvatar(
                                        backgroundImage:
                                            AssetImage(requests.image),
                                      )),
                                  Expanded(
                                      flex: 2,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            requests.name,
                                          ),
                                          Text(
                                            requests.typerequest,
                                          ),
                                        ],
                                      )),
                                  Expanded(flex: 1, child: Text(requests.date)),
                                  Expanded(
                                      flex: 2,
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              right:
                                                  MediaQueryUtil.screenWidth /
                                                      10),
                                          child: Text(
                                            "${requests.number}",
                                            textAlign: TextAlign.right,
                                          ),
                                        ),
                                      ))
                                ],
                              ),
                            ));
                      }),
                )),
          ],
        ),
      ),
    );
  }
}
