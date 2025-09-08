import 'package:bazaar2/core/const_data/app_image.dart';
import 'package:bazaar2/core/const_data/text_style.dart';
import 'package:bazaar2/core/service/media_query.dart';
import 'package:bazaar2/view/account/controller/accountcontroller.dart';
import 'package:bazaar2/view/account/widgets/genderselector.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GenderField extends StatelessWidget {
  const GenderField({super.key});

  @override
  Widget build(BuildContext context) {
    AccountController controller = Get.find<AccountController>();
    return Row(
      children: [
        Text('Gender', style: FontStyles.fieldTitleStyle(context)),
        SizedBox(width: MediaQueryUtil.screenWidth / 6.4375),
        GenderSelector(
          controller: controller,
          imagename: AppImages.maleIcon,
          gender: 'Male',
        ),
        SizedBox(width: MediaQueryUtil.screenWidth / 11.77),
        GenderSelector(
          controller: controller,
          imagename: AppImages.femaleIcon,
          gender: 'Female',
        ),
      ],
    );
  }
}
