// import 'package:bazaar2/core/const_data/app_image.dart';
// import 'package:bazaar2/core/service/media_query.dart';
// import 'package:bazaar2/core/service/routes.dart';
// import 'package:bazaar2/view/account/controller/accountcontroller.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class LoadingProfilePhoto extends StatelessWidget {
//   const LoadingProfilePhoto({super.key});

//   @override
//   Widget build(BuildContext context) {
//     AccountController controller = Get.find<AccountController>();
//     return GestureDetector(
//         onTap: () => Get.toNamed(Routes.account),
//         child: Obx(() => CircleAvatar(
//               radius: MediaQueryUtil.screenWidth / 21,
//               backgroundColor: Colors.grey.shade200,
//               child: ClipOval(
//                 child: controller.profileImageUrl.isNotEmpty
//                     ? CachedNetworkImage(
//                         imageUrl: controller.profileImageUrl.value,
//                         fit: BoxFit.cover,
//                         width: double.infinity,
//                         height: double.infinity,
//                         placeholder: (context, url) => const Center(
//                           child: CircularProgressIndicator(strokeWidth: 2),
//                         ),
//                         errorWidget: (context, url, error) => Image.asset(
//                           AppImages.profilephoto,
//                           fit: BoxFit.cover,
//                           width: double.infinity,
//                           height: double.infinity,
//                         ),
//                       )
//                     : Image.asset(
//                         AppImages.profilephoto,
//                         fit: BoxFit.cover,
//                         width: double.infinity,
//                         height: double.infinity,
//                       ),
//               ),
//             )));
//   }
// }
