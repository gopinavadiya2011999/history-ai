import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:get/get.dart';
import 'package:history_ai/infrastructure/firestore/firebase_options.dart';
import 'package:history_ai/infrastructure/languages/translation_services.dart';
import 'package:history_ai/infrastructure/routes/app_pages.dart';
import 'package:history_ai/infrastructure/routes/route_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ui/onboarding/splash_screen.dart';

SharedPreferences? preferences;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  preferences = await SharedPreferences.getInstance();
  Gemini.reInitialize(apiKey: "AIzaSyD8MDsuIV6ymQrmi3G_-h7LuGa9ZYksjqc", enableDebugging: false);

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then((FirebaseApp value) {});
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      enableLog: false,
      getPages: AppPages.routes,
      initialRoute: RouteConstants.splash,
      theme: ThemeData.light(useMaterial3: true),
      home: const SplashScreen(),
      // home: const MainScreen(),
      locale: TranslationService.locale,
      fallbackLocale: TranslationService.fallbackLocale,
      translations: TranslationService(),
    );
  }
}
