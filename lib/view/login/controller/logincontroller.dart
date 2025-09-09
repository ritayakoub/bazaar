// import 'package:bazaar2/core/service/my_service.dart';
// import 'package:bazaar2/core/service/routes.dart';
// import 'package:bazaar2/core/service/shared_preferences_key.dart';
// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';

// class LoginController extends GetxController {
//   final TextEditingController emailContoller = TextEditingController();
//   final TextEditingController passwordContoller = TextEditingController();
//   RxBool passwordVisible = false.obs;
//   GlobalKey<FormState> globalKey = GlobalKey<FormState>();
//   final myService = Get.find<MyService>();

//   Future<void> login() async {
//     if (globalKey.currentState!.validate()) {
//       await myService.sharedPreferences.setBool(
//         SharedPreferencesKey.isLogInKey,
//         true,
//       );

//       Get.offAllNamed(Routes.homeScreen);
//     }
//   }
// }
import 'dart:convert';

import 'package:bazaar2/core/const_data/app_colors.dart';
import 'package:bazaar2/core/const_data/const_data.dart';
import 'package:bazaar2/core/service/link.dart';
import 'package:bazaar2/core/service/media_query.dart';
import 'package:bazaar2/core/service/my_service.dart';
import 'package:bazaar2/core/service/routes.dart';
import 'package:bazaar2/core/service/shared_preferences_key.dart';
import 'package:bazaar2/view/model/profileusermodel.dart';
import 'package:bazaar2/widget/customtoast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  Rx<UserProfileModel?> user = Rx<UserProfileModel?>(null);
  RxBool isLoading = false.obs;
  final TextEditingController emailContoller = TextEditingController();
  final TextEditingController passwordContoller = TextEditingController();
  RxBool passwordVisible = false.obs;
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  final myService = Get.find<MyService>();

  Future<void> login() async {
    if (globalKey.currentState!.validate()) {
      try {
        isLoading.value = true;
        final response = await http.post(
          Uri.parse(AppLink.signin),
          headers: AppLink().getHeader(),
          body: jsonEncode({
            "email": emailContoller.text,
            "password": passwordContoller.text,
            "app_source": "admin"
          }),
        );

        final data = jsonDecode(response.body);

        if (response.statusCode == 200 && data["success"] == true) {
          final token = data["data"]["token"];

          await myService.sharedPreferences
              .setBool(SharedPreferencesKey.isLogInKey, true);
          await myService.sharedPreferences
              .setString(SharedPreferencesKey.tokenKey, token);

          user.value = UserProfileModel.fromJson(data["data"]["user"]);
          ConstData.token = token;
          ToastUtil.showToast(data['message'].toString());
          Get.offAllNamed(Routes.homeScreen);
        } else {
          Get.dialog(
            AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(MediaQueryUtil.screenWidth / 20.6),
                side: BorderSide(
                    color: Colors.red, width: MediaQueryUtil.screenWidth / 206),
              ),
              title: Row(
                children: [
                  const Icon(Icons.error, color: Colors.red),
                  SizedBox(width: MediaQueryUtil.screenWidth / 51.5),
                  const Text("Error", style: TextStyle(color: Colors.red)),
                ],
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(data["message"],
                      style: TextStyle(
                          fontSize: MediaQueryUtil.screenWidth / 25.75,
                          color: AppColors.black)),
                  Text(
                      'Make sure that email and password you entered are correct!',
                      style: TextStyle(
                          fontSize: MediaQueryUtil.screenWidth / 25.75,
                          color: AppColors.black))
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Get.back(),
                  child: const Text("OK", style: TextStyle(color: Colors.red)),
                ),
              ],
            ),
          );
        }
      } catch (e) {
        Get.snackbar("Error", e.toString());
        print(e.toString());
      } finally {
        isLoading.value = false;
      }
    }
  }
}
