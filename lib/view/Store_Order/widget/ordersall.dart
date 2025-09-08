import 'package:bazaar2/core/const_data/app_colors.dart';
import 'package:bazaar2/core/const_data/font_family.dart';
import 'package:bazaar2/core/service/media_query.dart';
import 'package:bazaar2/view/home/model/ordersmodel.dart';
import 'package:flutter/material.dart';

class Ordersall extends StatelessWidget {
  final Ordersmodel data;

  const Ordersall({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: MediaQueryUtil.screenHeight / 120,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(MediaQueryUtil.screenWidth / 51.5),
      ),
      padding: EdgeInsets.only(
        top: MediaQueryUtil.screenHeight / 60,
        bottom: MediaQueryUtil.screenHeight / 60,
      ),
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Text("${data.number}",
                  style: const TextStyle(fontFamily: FontFamily.russoOne))),
          Expanded(flex: 3, child: Text("\$${data.amount}")),
          Expanded(flex: 3, child: Text(data.customer)),
          Expanded(flex: 2, child: Text(data.date)),
          Expanded(
              flex: 3,
              child: Text(
                data.status,
                style: TextStyle(
                    color: data.status.toLowerCase() == "completed"
                        ? AppColors.primaryOrangeColor
                        : AppColors.black),
              )),
        ],
      ),
    );
  }
}
