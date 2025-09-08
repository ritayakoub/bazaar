import 'package:bazaar2/core/const_data/app_colors.dart';
import 'package:bazaar2/core/const_data/font_family.dart';
import 'package:bazaar2/core/service/media_query.dart';
import 'package:flutter/material.dart';

class DashboardItem {
  final String title;
  final num value;
  final IconData icon;
  final bool hasDollar;
  final bool showArrow;

  DashboardItem({
    required this.title,
    required this.value,
    required this.icon,
    this.hasDollar = false,
    this.showArrow = false,
  });
}

class DashboardCard extends StatelessWidget {
  final DashboardItem item;
  const DashboardCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(MediaQueryUtil.screenWidth / 30),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
              color: AppColors.borderLightGrey,
              blurRadius: 5,
              offset: Offset(0, 1)),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: -10,
            right: -10,
            child: Icon(
              item.icon,
              size: 80,
              color: AppColors.lightOrangeColor,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    item.title,
                    style: TextStyle(
                        fontSize: MediaQueryUtil.screenWidth / 22.4,
                        color: AppColors.black),
                  ),
                  if (item.showArrow)
                    Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Icon(Icons.arrow_upward,
                          color: Colors.green,
                          size: MediaQueryUtil.screenWidth / 20.4),
                    ),
                ],
              ),
              const Spacer(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (item.hasDollar)
                    Text(
                      '\$',
                      style: TextStyle(
                          fontSize: MediaQueryUtil.screenWidth / 15.4,
                          color: AppColors.primaryOrangeColor,
                          fontFamily: FontFamily.russoOne),
                    ),
                  Text(
                    _formatValue(item.value),
                    style: TextStyle(
                        fontSize: MediaQueryUtil.screenWidth / 12.4,
                        color: AppColors.black,
                        fontFamily: FontFamily.russoOne),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatValue(num value) {
    if (value >= 1000) {
      return "${(value / 1000).toStringAsFixed(1)}k";
    } else {
      return value.toString();
    }
  }
}
