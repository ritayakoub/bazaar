import 'package:bazaar2/view/account/controller/accountcontroller.dart';
import 'package:get/get.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AccountController(), fenix: true);
  }
}
