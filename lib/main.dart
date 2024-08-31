import 'package:character_ai/inftrastructure/commons/theme_changer.dart';
import 'package:character_ai/inftrastructure/routes/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'inftrastructure/routes/app_pages.dart';
import 'ui/onboarding/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.put(ThemeController());
    final brightness = MediaQuery.of(context).platformBrightness;

    themeController.applySystemTheme(brightness);

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      enableLog: false,
      getPages: AppPages.routes,
      initialRoute: RouteConstants.splash,
      theme: themeController.currentTheme.value,
      home: const SplashScreen(),
    );
  }
}
