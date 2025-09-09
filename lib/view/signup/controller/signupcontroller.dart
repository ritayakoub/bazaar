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
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

// class SignUpController extends GetxController {
//   final TextEditingController nameContoller = TextEditingController();
//   final TextEditingController emailContoller = TextEditingController();
//   final TextEditingController phoneContoller = TextEditingController();
//   final TextEditingController passwordContoller = TextEditingController();
//   final TextEditingController confirmPasswordContoller =
//       TextEditingController();
//   String? password;
//   RxBool passwordVisible = false.obs;
//   RxBool passwordVisible2 = false.obs;
//   GlobalKey<FormState> globalKey = GlobalKey<FormState>();
//   final myService = Get.find<MyService>();
//   Future<void> signUp() async {
//     globalKey.currentState!.save();
//     if (globalKey.currentState!.validate()) {
//       await myService.sharedPreferences.setBool(
//         SharedPreferencesKey.isLogInKey,
//         true,
//       );

//       await myService.sharedPreferences.setString(
//         SharedPreferencesKey.userNameKey,
//         nameContoller.text,
//       );
//       await myService.sharedPreferences.setString(
//         SharedPreferencesKey.userEmailKey,
//         emailContoller.text,
//       );
//       await myService.sharedPreferences.setString(
//         SharedPreferencesKey.userNumberKey,
//         phoneContoller.text,
//       );

//       Get.offAllNamed(Routes.homeScreen);
//     }
//   }
// }
class SignUpController extends GetxController {
  Rx<UserProfileModel?> user = Rx<UserProfileModel?>(null);
  final TextEditingController nameContoller = TextEditingController();
  final TextEditingController emailContoller = TextEditingController();
  final TextEditingController phoneContoller = TextEditingController();
  final TextEditingController passwordContoller = TextEditingController();
  final TextEditingController confirmPasswordContoller =
      TextEditingController();
  String? password;
  RxBool passwordVisible = false.obs;
  RxBool passwordVisible2 = false.obs;
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  final myService = Get.find<MyService>();
  RxBool isLoading = false.obs;

  Future<void> signUp() async {
    globalKey.currentState!.save();
    if (globalKey.currentState!.validate()) {
      try {
        isLoading.value = true;
        final response = await http.post(
          Uri.parse(AppLink.signup),
          headers: AppLink().getHeader(),
          body: jsonEncode({
            "name": nameContoller.text,
            "email": emailContoller.text,
            "number": phoneContoller.text,
            "password": passwordContoller.text,
            "app_source": "admin"
          }),
        );

        final data = jsonDecode(response.body);

        if (response.statusCode == 200 && data["success"] == true) {
          final token = data["data"]["token"];
          print(data["data"]["token"]);
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
                  if (data['data']['email'] != null)
                    Text(data['data']['email'].toString(),
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
      } finally {
        isLoading.value = false;
      }
    }
  }
}
