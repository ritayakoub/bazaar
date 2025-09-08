import 'package:bazaar2/core/const_data/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../core/const_data/app_image.dart';
import '../../../core/service/media_query.dart';

class Drawerlisttile extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const Drawerlisttile({
    super.key,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      child: ListTile(
          title: Text(
            title,
            style: TextStyle(
              color: AppColors.darkGrey,
              fontSize: MediaQueryUtil.screenWidth / 19.3,
            ),
          ),
          onTap: onTap,
          trailing: Image.asset(AppImages.iosArrowright,
              width: MediaQueryUtil.screenWidth / 20.6,
              color: AppColors.black70)),
    );
  }
}
