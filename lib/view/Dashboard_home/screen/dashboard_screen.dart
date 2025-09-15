import 'package:bazaar2/core/const_data/font_family.dart';
import 'package:bazaar2/core/service/media_query.dart';
import 'package:bazaar2/view/Dashboard_home/model/dashboardItem.dart';
import 'package:bazaar2/view/Dashboard_home/widgets/ProductCard.dart';
import 'package:bazaar2/view/Dashboard_home/widgets/orders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/const_data/app_colors.dart';
import '../controller/dashboard_controller.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardController());

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Obx(() {
        final items = [
          DashboardItem(
            title: 'Total Sales',
            value: controller.totalSales.value,
            icon: Icons.shopping_cart_outlined,
            hasDollar: true,
          ),
          DashboardItem(
            title: 'Revenue',
            value: controller.revenue.value,
            icon: Icons.account_balance_wallet_outlined,
            hasDollar: true,
            showArrow: true,
          ),
          DashboardItem(
            title: 'Total Orders',
            value: controller.totalOrders.value,
            icon: Icons.local_shipping_outlined,
          ),
          DashboardItem(
            title: 'Products',
            value: controller.products.value,
            icon: Icons.widgets_outlined,
          ),
        ];

        return SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          GridView.builder(
            shrinkWrap: true,
            itemCount: items.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 1.6,
            ),
            itemBuilder: (context, index) {
              return DashboardCard(item: items[index]);
            },
          ),
          SizedBox(
            height: MediaQueryUtil.screenHeight / 30.5,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: MediaQueryUtil.screenHeight / 35),
            child: Text(
              'Latest Orders',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontFamily: FontFamily.russoOne,
                  fontSize: MediaQueryUtil.screenWidth / 15.45),
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
              height: MediaQueryUtil.screenHeight / 4,
              child: Obx(
                () => ListView.builder(
                    itemCount: controller.orderItems.length >= 3
                        ? 3
                        : controller.orderItems.length,
                    itemBuilder: (context, index) {
                      final order = controller.orderItems[index];
                      return Orders(data: order);
                    }),
              )),
          Padding(
            padding: EdgeInsets.only(bottom: MediaQueryUtil.screenHeight / 35),
            child: Text(
              'Best Sallers',
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontFamily: FontFamily.russoOne,
                  fontSize: MediaQueryUtil.screenWidth / 15.45),
            ),
          ),
          SizedBox(
              height: MediaQueryUtil.screenHeight / 1.5,
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
                    return CustomProductCard(
                        data: controller.productCardItem[index]);
                  },
                ),
              )),
        ]));
      }),
    );
  }
}
