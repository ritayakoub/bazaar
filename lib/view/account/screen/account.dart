import 'package:bazaar2/core/const_data/app_colors.dart';
import 'package:bazaar2/core/const_data/app_image.dart';
import 'package:bazaar2/core/const_data/text_style.dart';
import 'package:bazaar2/core/service/media_query.dart';
import 'package:bazaar2/view/account/controller/accountcontroller.dart';
import 'package:bazaar2/view/account/widgets/accountappbar.dart';
import 'package:bazaar2/view/account/widgets/agefield.dart';
import 'package:bazaar2/view/account/widgets/emailfield.dart';
import 'package:bazaar2/view/account/widgets/genderfield.dart';
import 'package:bazaar2/view/account/widgets/namefield.dart';
import 'package:bazaar2/view/account/widgets/numberfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    AccountController controller = Get.find<AccountController>();
    MediaQueryUtil.init(context);
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: const AccountAppBar(),
      body: Form(
        key: controller.globalKey,
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: MediaQueryUtil.screenHeight / 42.2,
                right: MediaQueryUtil.screenWidth / 20.6,
                left: MediaQueryUtil.screenWidth / 20.6,
                bottom: MediaQueryUtil.screenHeight / 42.2,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Text('Photo', style: FontStyles.fieldTitleStyle(context)),
                      Center(
                        child: Column(
                          children: [
                            Obx(() {
                              return GestureDetector(
                                onTap: () => controller.imageButtonFunction(),
                                onLongPress: () {},
                                child: CircleAvatar(
                                  radius: MediaQueryUtil.screenWidth / 10,
                                  backgroundImage:
                                      controller.profileImage.value != null
                                          ? FileImage(
                                            controller.profileImage.value!,
                                          )
                                          : AssetImage(AppImages.profilephoto)
                                              as ImageProvider,
                                ),
                              );
                            }),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQueryUtil.screenHeight / 25),
                  const NameField(),
                  SizedBox(height: MediaQueryUtil.screenHeight / 15),
                  const AgeField(),
                  SizedBox(height: MediaQueryUtil.screenHeight / 15),
                  const EmailField(),
                  SizedBox(height: MediaQueryUtil.screenHeight / 15),
                  const NumberField(),
                  SizedBox(height: MediaQueryUtil.screenHeight / 15),
                  const GenderField(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
