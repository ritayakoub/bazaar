import 'package:bazaar2/core/const_data/app_colors.dart';
import 'package:bazaar2/core/const_data/app_image.dart';
import 'package:bazaar2/core/const_data/font_family.dart';
import 'package:bazaar2/core/const_data/text_style.dart';
import 'package:bazaar2/core/service/media_query.dart';
import 'package:bazaar2/core/service/routes.dart';
import 'package:bazaar2/view/login/controller/logincontroller.dart';
import 'package:bazaar2/widget/custombutton.dart';
import 'package:bazaar2/widget/emailfield.dart';
import 'package:bazaar2/widget/passwordfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController());
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQueryUtil.screenWidth / 13.73,
                vertical: MediaQueryUtil.screenHeight / 40,
              ),
              child: Center(
                child: Column(
                  children: [
                    Image.asset(
                      AppImages.appIcon,
                      width: MediaQueryUtil.screenWidth / 3.16,
                    ),
                    SizedBox(height: MediaQueryUtil.screenHeight / 18.75),
                    Text(
                      'Welcome back',
                      style: TextStyle(
                        fontFamily: FontFamily.russoOne,
                        color: AppColors.primaryOrangeColor,
                        fontSize: MediaQueryUtil.screenWidth / 20.6,
                      ),
                    ),
                    Text(
                      'Sign in to continue',
                      style: TextStyle(
                        color: AppColors.primaryFontColor,
                        fontSize: MediaQueryUtil.screenWidth / 29.42,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQueryUtil.screenWidth / 13.73,
                  ),
                  child: Form(
                    key: controller.globalKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: MediaQueryUtil.screenHeight / 21.64),
                        Text(
                          'Email',
                          style: FontStyles.fieldTitleStyle(context),
                        ),
                        SizedBox(height: MediaQueryUtil.screenHeight / 64.92),
                        CustomEmailField(contoller: controller.emailContoller),
                        SizedBox(height: MediaQueryUtil.screenHeight / 52.75),
                        Text(
                          'Password',
                          style: FontStyles.fieldTitleStyle(context),
                        ),
                        SizedBox(height: MediaQueryUtil.screenHeight / 64.92),
                        CustomPasswordField(
                          textEditingController: controller.passwordContoller,
                          controller: controller,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              Get.toNamed(Routes.recoverpass);
                            },
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(
                                fontSize: MediaQueryUtil.screenWidth / 34.33,
                                color: AppColors.primaryOrangeColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: MediaQueryUtil.screenHeight / 21.1),
                        CustomButton(
                          title: 'Sign In',
                          onPressed: () => controller.login(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: MediaQueryUtil.screenHeight / 60,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don’t have an account?',
                    style: FontStyles.havingAccTextStyle(context),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.offAllNamed(Routes.signup);
                    },
                    child: Text(
                      'Sign Up',
                      style: FontStyles.havingAccSignStyle(context),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
                trailing: Image.asset(AppImages.iosArrowright,
                    width: MediaQueryUtil.screenWidth / 20.6,
                    color: AppColors.primaryOrangeColor))
          ],
        ),
      ),
    );
  }
}
