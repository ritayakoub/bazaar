import 'package:bazaar2/core/const_data/app_colors.dart';
import 'package:bazaar2/core/const_data/app_image.dart';
import 'package:bazaar2/core/service/media_query.dart';
import 'package:bazaar2/view/product/controller/product_controller.dart';
import 'package:bazaar2/view/product/screen/commentpage.dart';
import 'package:bazaar2/view/product/widget/addcomment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductComments extends StatelessWidget {
  const ProductComments({super.key});

  @override
  Widget build(BuildContext context) {
    ProductController controller = Get.find<ProductController>();
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        // appBar: const CustomAppBarWithBack(text: 'Comments'),
        body: Container()
        // Column(
        //   children: [
        //     Obx(() {
        //       final currentProduct = controller.product.value;
        //       if (currentProduct == null) {
        //         return const Text("null");
        //         // return const Expanded(child: CustomProgressIndicator());
        //       }
        //       // if (controller.isLoadingFetching.value) {
        //       //   return const Expanded(child: CustomProgressIndicator());
        //       // }

        //       return currentProduct.comments.isNotEmpty
        //           ? Expanded(
        //               child: Padding(
        //                 padding: EdgeInsets.symmetric(
        //                   horizontal: MediaQueryUtil.screenWidth / 20.6,
        //                   vertical: MediaQueryUtil.screenHeight / 70,
        //                 ),
        //                 child: ListView.builder(
        //                   clipBehavior: Clip.none,
        //                   itemCount: currentProduct.comments.length,
        //                   itemBuilder: (context, index) {
        //                     final comment = currentProduct.comments[index];
        //                     return Container(
        //                       margin: EdgeInsets.only(
        //                         bottom: MediaQueryUtil.screenHeight / 52.75,
        //                       ),
        //                       padding: EdgeInsets.all(
        //                         MediaQueryUtil.screenWidth / 25.75,
        //                       ),
        //                       decoration: BoxDecoration(
        //                         color: AppColors.white,
        //                         borderRadius: BorderRadius.circular(
        //                           MediaQueryUtil.screenWidth / 51.5,
        //                         ),
        //                       ),
        //                       child: Column(
        //                         crossAxisAlignment: CrossAxisAlignment.start,
        //                         children: [
        //                           Row(
        //                             mainAxisAlignment:
        //                                 MainAxisAlignment.spaceBetween,
        //                             crossAxisAlignment: CrossAxisAlignment.center,
        //                             children: [
        //                               Row(children: [
        //                                 buildCommentImage(comment.profilePhoto),
        //                                 SizedBox(
        //                                     width: MediaQueryUtil.screenWidth /
        //                                         68.66),
        //                                 Text(
        //                                   comment.name,
        //                                   style: TextStyle(
        //                                     fontSize: MediaQueryUtil.screenWidth /
        //                                         25.75,
        //                                     color: AppColors.primaryFontColor,
        //                                   ),
        //                                 ),
        //                               ]),
        //                               Row(children: [
        //                                 Text(
        //                                   '${comment.rating.toInt().toString()} ',
        //                                   style: TextStyle(
        //                                     fontSize: MediaQueryUtil.screenWidth /
        //                                         25.75,
        //                                     color: AppColors.primaryFontColor,
        //                                   ),
        //                                 ),
        //                                 Image.asset(AppImages.starIcon,
        //                                     width: 16),
        //                               ]),
        //                             ],
        //                           ),
        //                           SizedBox(
        //                               height:
        //                                   MediaQueryUtil.screenHeight / 140.6),
        //                           Text(
        //                             comment.comment,
        //                             style: TextStyle(
        //                               fontSize:
        //                                   MediaQueryUtil.screenWidth / 25.75,
        //                               color: AppColors.black60,
        //                             ),
        //                           ),
        //                         ],
        //                       ),
        //                     );
        //                   },
        //                 ),
        //               ),
        //             )
        //           : Expanded(
        //               child: Center(
        //                 child: Text(
        //                   'No comments yet',
        //                   style: TextStyle(
        //                     fontSize: MediaQueryUtil.screenWidth / 25.75,
        //                     color: AppColors.black60,
        //                   ),
        //                 ),
        //               ),
        //             );
        //     }),
        //     const AddComment(),
        //   ],
        // ),
        );
  }
}
