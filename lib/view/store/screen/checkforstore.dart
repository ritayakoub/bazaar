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
    return Scaffold(
      body: Obx(() {
        if (storeController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return storeController.hasStore.value
              ? Storecreated(
                  onStoreDeleted: () {
                    storeController.hasStore.value = false;
                  },
                  onStoreUpdated: () {
                    storeController.checkStore();
                  },
                )
              : const Createstore();
        }
      }),
    );
  }
}
