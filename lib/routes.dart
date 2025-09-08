import 'package:bazaar2/view/account/screen/account.dart';
import 'package:bazaar2/view/home/screen/home_screen.dart';
import 'package:bazaar2/view/login/screen/login.dart';
import 'package:bazaar2/view/recoverpassword/screen/recoverpass.dart';
import 'package:bazaar2/view/signup/screen/signup.dart';
import 'package:bazaar2/view/splash/screen/splash.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
    name: "/homeScreen",
    page: () => const HomeScreen(),
    transition: Transition.rightToLeftWithFade,
  ),
  GetPage(
    name: "/login",
    page: () => const Login(),
    transition: Transition.rightToLeftWithFade,
  ),
  GetPage(
    name: "/signup",
    page: () => const SignUp(),
    transition: Transition.rightToLeftWithFade,
  ),
  GetPage(
    name: "/recoverpass",
    page: () => const RecoverPassword(),
    transition: Transition.rightToLeftWithFade,
  ),
  GetPage(
    name: "/splash",
    page: () => const Splash(),
    transition: Transition.rightToLeftWithFade,
  ),
  GetPage(
    name: "/account",
    page: () => const Account(),
    transition: Transition.rightToLeftWithFade,
  ),
];
