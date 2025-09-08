import 'package:bazaar2/core/const_data/app_colors.dart';
import 'package:bazaar2/core/const_data/font_family.dart';
import 'package:bazaar2/view/Dashboard_home/controller/dashboard_controller.dart';
import 'package:bazaar2/view/Dashboard_home/widgets/ProductCard.dart';
import 'package:bazaar2/view/home/controller/home_controller.dart';
import 'package:bazaar2/view/home/widgets/CustomDrawer.dart';
import 'package:bazaar2/widget/defaultappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/service/media_query.dart';

class Requestproduct extends StatelessWidget {
  final dynamic request;

  const Requestproduct({super.key, required this.request});

  @override
  Widget build(BuildContext context) {
    final controllerh = Get.find<HomeController>();
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
              Row(children: [
                ClipRRect(
                  borderRadius:
                      BorderRadius.circular(MediaQueryUtil.screenWidth / 51.5),
                  child: Image.asset(
                    request.image,
                    width: MediaQueryUtil.screenWidth / 7,
                  ),
                ),
                SizedBox(width: MediaQueryUtil.screenWidth / 25),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      request.name,
                      style: TextStyle(
                          fontSize: MediaQueryUtil.screenWidth / 18.3,
                          fontFamily: FontFamily.russoOne,
                          color: AppColors.black70),
                    ),
                    Text(
                      request.typerequest,
                      style: TextStyle(
                          fontSize: MediaQueryUtil.screenWidth / 25,
                          color: AppColors.black70),
                    ),
                  ],
                ),
                const Spacer(),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "View Store",
                      style: TextStyle(
                          color: AppColors.black70,
                          fontSize: MediaQueryUtil.screenWidth / 28),
                    ))
              ]),
              SizedBox(
                height: MediaQueryUtil.screenHeight / 30,
              ),
              Text(
                "Products",
                style: TextStyle(
                    fontFamily: FontFamily.russoOne,
                    fontSize: MediaQueryUtil.screenWidth / 16.2),
              ),
              Expanded(
                child: Obx(
                  () => GridView.builder(
                    itemCount: controller.productCardItem.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: MediaQueryUtil.screenHeight / 3.8,
                      crossAxisSpacing: MediaQueryUtil.screenWidth / 27.46,
                      mainAxisSpacing: MediaQueryUtil.screenHeight / 49.64,
                    ),
                    itemBuilder: (context, index) {
                      return ProductCard(
                          data: controller.productCardItem[index]);
                    },
                  ),
                ),
              )
            ],
          )),
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
                color: AppColors.primaryOrangeColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    MediaQueryUtil.screenWidth / 51.5,
                  ),
                ),
                child: Text(
                  "Confirm",
                  style: TextStyle(
                    fontFamily: FontFamily.montserrat,
                    color: AppColors.white,
                    fontSize: MediaQueryUtil.screenWidth / 25.75,
                  ),
                ),
              )),
              SizedBox(width: MediaQueryUtil.screenWidth / 20),
              Expanded(
                child: MaterialButton(
                  onPressed: () {},
                  color: AppColors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      MediaQueryUtil.screenWidth / 51.5,
                    ),
                  ),
                  child: Text(
                    "Reject",
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
