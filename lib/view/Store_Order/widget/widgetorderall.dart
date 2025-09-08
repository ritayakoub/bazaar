import 'package:bazaar2/core/const_data/app_colors.dart';
import 'package:bazaar2/core/const_data/font_family.dart';
import 'package:bazaar2/core/service/media_query.dart';
import 'package:bazaar2/view/Dashboard_home/controller/dashboard_controller.dart';
import 'package:bazaar2/view/Store_Order/widget/ordersall.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Widgetorderall extends StatelessWidget {
  const Widgetorderall({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardController());
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Padding(
            padding: EdgeInsets.only(
              top: MediaQueryUtil.screenHeight / 74,
              left: MediaQueryUtil.screenWidth / 45,
              right: MediaQueryUtil.screenWidth / 100,
            ),
            child: ListView(
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(bottom: MediaQueryUtil.screenWidth / 30),
                  child: Text(
                    "Orders",
                    style: TextStyle(
                        fontFamily: FontFamily.russoOne,
                        fontSize: MediaQueryUtil.screenWidth / 15),
                  ),
                ),
                const Row(
                  children: [
                    Expanded(flex: 1, child: Text('N.')),
                    Expanded(flex: 2, child: Text('Amount')),
                    Expanded(
                        flex: 3,
                        child: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text('Customer'),
                        )),
                    Expanded(
                      flex: 2,
                      child: Text('Date'),
                    ),
                    Expanded(flex: 2, child: Text('Status'))
                  ],
                ),
                SizedBox(
                    height: MediaQueryUtil.screenHeight / 1,
                    child: Obx(
                      () => ListView.builder(
                          itemCount: controller.orderItems.length,
                          itemBuilder: (context, index) {
                            final order = controller.orderItems[index];
                            return Ordersall(data: order);
                          }),
                    )),
              ],
            )));
  }
}
