// import 'package:bazaar2/view/store/controller/createstore_controller.dart';
// import 'package:bazaar2/view/store/screen/createstore.dart';
// import 'package:bazaar2/view/store/widgets/Storecreated.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class Checkforstore extends StatelessWidget {
//   final storeController = Get.put(CreatestoreController(), permanent: true);

//   Checkforstore({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Obx(() {
//         if (storeController.isLoading.value) {
//           return const Center(child: CircularProgressIndicator());
//         } else {
//           return storeController.hasStore.value
//               ? const Storecreated()
//               : const Createstore();
//         }
//       }),
//     );
//   }
// }
import 'package:bazaar2/view/store/controller/createstore_controller.dart';
import 'package:bazaar2/view/store/screen/createstore.dart';
import 'package:bazaar2/view/store/widgets/Storecreated.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Checkforstore extends StatelessWidget {
  final storeController = Get.put(CreatestoreController(), permanent: true);

  Checkforstore({super.key});

  @override
  Widget build(BuildContext context) {
    // أي عملية تعديل أو حذف ستتحدث مباشرة هنا بفضل Obx
    return Scaffold(
      body: Obx(() {
        if (storeController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          // إذا يوجد متجر، عرض صفحة المتجر، وإلا عرض صفحة إنشاء المتجر
          return storeController.hasStore.value
              ? Storecreated(
                  onStoreDeleted: () {
                    // عندما يحذف المستخدم المتجر، نعيد قيمة hasStore إلى false
                    storeController.hasStore.value = false;
                  },
                  onStoreUpdated: () {
                    // إذا عدّل المستخدم بيانات المتجر، يمكن تحديث واجهة المستخدم
                    storeController.checkStore(); // إعادة تحميل الحالة
                  },
                )
              : const Createstore();
        }
      }),
    );
  }
}
