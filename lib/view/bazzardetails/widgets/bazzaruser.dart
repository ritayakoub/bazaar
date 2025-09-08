import 'package:bazaar2/core/const_data/app_colors.dart';
import 'package:bazaar2/core/service/media_query.dart';
import 'package:bazaar2/view/bazzardetails/controller/bazzarcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Bazzaruser extends StatelessWidget {
  const Bazzaruser({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BazzarController>();
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                bottom: MediaQueryUtil.screenHeight / 60,
                top: MediaQueryUtil.screenHeight / 80),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "User",
                  style: TextStyle(
                      fontSize: MediaQueryUtil.screenWidth / 22.5,
                      color: AppColors.black),
                ),
                Text(
                  "Product",
                  style: TextStyle(
                      fontSize: MediaQueryUtil.screenWidth / 22.5,
                      color: AppColors.black),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: controller.usermodel.length,
                itemBuilder: (context, index) {
                  final user = controller.usermodel[index];
                  return Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQueryUtil.screenHeight / 60),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(
                            MediaQueryUtil.screenWidth / 51), // 👈 حواف مدورة
                      ),
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                AssetImage(user.imageuser), // 👈 هون التعديل
                          ),
                          SizedBox(width: MediaQueryUtil.screenWidth / 20),
                          Text(
                            user.name,
                            style: TextStyle(
                                fontSize: MediaQueryUtil.screenWidth / 22.5,
                                color: AppColors.black),
                          ),
                          const Spacer(flex: 2),
                          Text(
                            user.products.toString(),
                            style: TextStyle(
                                fontSize: MediaQueryUtil.screenWidth / 22.5,
                                color: AppColors.black),
                          ),
                          const Spacer(flex: 1),
                        ],
                      ),
                    ),
                  );
                  // ListTile(
                  //   leading: CircleAvatar(
                  //     backgroundImage: NetworkImage(user.imageuser),
                  //   ),
                  //   title: Text(user.name),
                  //   trailing: Text(user.products.toString()),
                  // );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
