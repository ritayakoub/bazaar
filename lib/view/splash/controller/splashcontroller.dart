import 'package:bazaar2/core/service/shared_preferences_key.dart';
import 'package:get/get.dart';
import 'package:bazaar2/core/service/my_service.dart';
import 'package:bazaar2/core/service/routes.dart';

class SplashController extends GetxController {
  final myService = Get.find<MyService>();

  @override
  void onInit() {
    super.onInit();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    await Future.delayed(const Duration(seconds: 3));

    final isLoggedIn =
        myService.sharedPreferences.getBool(SharedPreferencesKey.isLogInKey) ??
        false;

    if (isLoggedIn) {
      Get.offAllNamed(Routes.homeScreen);
    } else {
      Get.offAllNamed(Routes.login);
    }
  }
}
