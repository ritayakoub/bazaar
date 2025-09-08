import 'package:bazaar2/core/const_data/themes.dart';
import 'package:bazaar2/core/service/media_query.dart';
import 'package:bazaar2/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'binding/initial_bindings.dart';
import 'core/service/my_service.dart';
import 'core/service/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  MyService();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryUtil.init(context);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: InitialBindings(),
      theme: Themes.appTheme(),
      getPages: routes,
      initialRoute: Routes.splash,
    );
  }
}
