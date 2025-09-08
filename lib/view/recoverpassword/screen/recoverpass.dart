import 'package:bazaar2/core/const_data/app_colors.dart';
import 'package:bazaar2/core/const_data/app_image.dart';
import 'package:bazaar2/core/const_data/text_style.dart';
import 'package:bazaar2/core/service/media_query.dart';
import 'package:bazaar2/view/recoverpassword/controller/recoverpasscontroller.dart';
import 'package:bazaar2/widget/custombutton.dart';
import 'package:bazaar2/widget/emailfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecoverPassword extends StatelessWidget {
  const RecoverPassword({super.key});

  @override
  Widget build(BuildContext context) {
    RecoverPasswordController controller = Get.put(RecoverPasswordController());
    MediaQueryUtil.init(context);
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQueryUtil.screenHeight / 14.06,
          left: MediaQueryUtil.screenWidth / 13.73,
          right: MediaQueryUtil.screenWidth / 13.73,
        ),
        child: Form(
          key: controller.globalKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => Get.back(),
                child: Image.asset(
                  AppImages.arrowBack,
                  width: MediaQueryUtil.screenWidth / 17.16,
                ),
              ),
              SizedBox(height: MediaQueryUtil.screenHeight / 7),
              Center(
                child: Column(
                  children: [
                    Text(
                      'Forgot Password',
                      style: TextStyle(
                        fontSize: MediaQueryUtil.screenWidth / 17.16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryFontColor,
                      ),
                    ),
                    SizedBox(height: MediaQueryUtil.screenHeight / 42.2),
                    Text(
                      'Enter the email address associated\nwith your account.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: MediaQueryUtil.screenWidth / 25.75,
                        color: AppColors.darkGrey,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQueryUtil.screenHeight / 30.14),
              Text('Email', style: FontStyles.fieldTitleStyle(context)),
              SizedBox(height: MediaQueryUtil.screenHeight / 64.92),
              CustomEmailField(contoller: controller.emailContoller),
              SizedBox(height: MediaQueryUtil.screenHeight / 30.14),
              CustomButton(
                title: 'Recover Password',
                onPressed: () {
                  if (controller.globalKey.currentState!.validate()) {}
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
