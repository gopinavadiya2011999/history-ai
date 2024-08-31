import 'package:character_ai/inftrastructure/routes/route_constants.dart';
import 'package:character_ai/ui/main_binding.dart';
import 'package:character_ai/ui/main_screen.dart';
import 'package:character_ai/ui/onboarding/create_character/create_character_binding.dart';
import 'package:character_ai/ui/onboarding/create_character/create_character_screen.dart';
import 'package:character_ai/ui/onboarding/splash_screen.dart';
import 'package:get/get.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: RouteConstants.splash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: RouteConstants.createCharacter,
      page: () => const CreateCharacterScreen(),
      binding: CreateCharacterBinding(),
    ),
    GetPage(
      name: RouteConstants.mainScreen,
      page: () => const MainScreen(),
      binding: MainBinding(),
    ),
  ];
}
