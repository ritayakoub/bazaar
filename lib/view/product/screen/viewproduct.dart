import 'package:bazaar2/view/product/widget/viewproductwidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bazaar2/core/const_data/app_colors.dart';
import 'package:bazaar2/core/service/media_query.dart';
import 'package:bazaar2/view/home/controller/home_controller.dart';
import 'package:bazaar2/widget/defaultappbar.dart';

class Viewproduct extends StatelessWidget {
  final String id;
  const Viewproduct({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return Stack(children: [
      Scaffold(
        appBar: DefaultAppBar(
          onMenuTap: controller.toggleDrawer,
        ),
        backgroundColor: AppColors.backgroundColor,
        body: Viewproductwidget(
          id: id,
        ),
      )
    ]);
  }
}
