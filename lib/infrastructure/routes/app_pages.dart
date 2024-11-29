import 'package:history_ai/infrastructure/routes/route_constants.dart';
import 'package:history_ai/ui/chat/chat_binding.dart';
import 'package:history_ai/ui/chat/chat_screen.dart';

import 'package:history_ai/ui/main_screen/main_binding.dart';
import 'package:history_ai/ui/main_screen/main_screen.dart';
import 'package:history_ai/ui/main_screen/sub_files/ask_anything_view.dart';
import 'package:history_ai/ui/onboarding/create_character/create_character_binding.dart';
import 'package:history_ai/ui/onboarding/create_character/create_character_screen.dart';
import 'package:history_ai/ui/onboarding/intro/intro_binding.dart';
import 'package:history_ai/ui/onboarding/intro/intro_screen.dart';
import 'package:history_ai/ui/onboarding/intro/open_account.dart';
import 'package:history_ai/ui/onboarding/splash_screen.dart';
import 'package:get/get.dart';
import 'package:history_ai/ui/person/search_by_person_binding.dart';
import 'package:history_ai/ui/person/search_by_person_view.dart';
import 'package:history_ai/ui/person/sub_files/choose_own_person.dart';
import 'package:history_ai/ui/person/sub_files/choose_person_option_view.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: RouteConstants.splash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: RouteConstants.intro,
      page: () => const IntroScreen(),
      binding: IntroBinding(),
    ),
    GetPage(
      name: RouteConstants.askAnything,
      page: () => const AskAnythingView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: RouteConstants.openAccount,
      page: () => const OpenAccountScreen(),
      binding: IntroBinding(),
    ),
    GetPage(
      name: RouteConstants.chatScreen,
      page: () => const ChatScreen(),
      binding: ChatBinding(),
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
    GetPage(
      name: RouteConstants.searchByPersonScreen,
      page: () => const SearchByPersonView(),
      binding: SearchByPersonBinding(),
    ),
    GetPage(
      name: RouteConstants.choosePersonOptionScreen,
      page: () => const ChoosePersonOptionView(),
      binding: SearchByPersonBinding(),
    ),
    GetPage(
      name: RouteConstants.chooseOwnPersonView,
      page: () => const ChooseOwnPersonView(),
      binding: SearchByPersonBinding(),
    ),
  ];
}
