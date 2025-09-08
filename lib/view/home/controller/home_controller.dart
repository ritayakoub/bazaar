import 'package:bazaar2/core/service/media_query.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  bool isDrawerOpen = false;
  double drawerWidth = MediaQueryUtil.screenWidth * 0.75;

  get locationType => null;
  void toggleDrawer() {
    isDrawerOpen = !isDrawerOpen;
    update();
  }

  void closeDrawer() {
    isDrawerOpen = false;
    update();
  }

  void openDrawer() {
    isDrawerOpen = true;
    update();
  }
}
