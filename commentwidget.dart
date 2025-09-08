import 'package:bazaar2/core/const_data/app_colors.dart';
import 'package:bazaar2/core/const_data/app_image.dart';
import 'package:bazaar2/core/service/media_query.dart';
import 'package:bazaar2/view/product/screen/commentpage.dart';
import 'package:flutter/material.dart';

class CommentWidget extends StatelessWidget {
  final String profilePhoto;
  final String name;
  final int rating;
  final String comment;

  const CommentWidget({
    super.key,
    required this.profilePhoto,
    required this.name,
    required this.rating,
    required this.comment,
  });

  @override
  Widget build(BuildContext context) {
    MediaQueryUtil.init(context);
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQueryUtil.screenHeight / 52.75),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(children: [
                  buildCommentImage(profilePhoto),
                  SizedBox(width: MediaQueryUtil.screenWidth / 68.66),
                  Text(name,
                      style: TextStyle(
                          fontSize: MediaQueryUtil.screenWidth / 25.75,
                          color: AppColors.primaryFontColor))
                ]),
                Row(children: [
                  Text('${rating.toString()} ',
                      style: TextStyle(
                          fontSize: MediaQueryUtil.screenWidth / 25.75,
                          color: AppColors.primaryFontColor)),
                  Image.asset(AppImages.starIcon, width: 16)
                ])
              ]),
          SizedBox(height: MediaQueryUtil.screenHeight / 140.6),
          Text(
            comment,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontSize: MediaQueryUtil.screenWidth / 25.75,
                color: AppColors.black60),
          )
        ],
      ),
    );
  }
}
